<?php
session_start(); // Start the session
include_once("connections/connection.php");
$con = connection();

// submitted via POST
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $products = $_POST['products'];
    $paymentMethod = $_POST['payment_method'];
    $userId = $_SESSION['user_id'];
    $customerPaid = $_POST['customer_paid']; // Amount paid by the customer

    // Check if user_id is set
    if (!isset($userId)) {
        echo "User not logged in.";
        exit;
    }

    // Calculate total amount
    $amountPaid = 0;
    $productDetails = []; // Array to store product details for the recei   pt
    foreach ($products as $product) {
        if (isset($product['quantity']) && $product['quantity'] > 0) {
            $quantity = $product['quantity'];
            $price = $product['price'];
            $amountPaid += $price * $quantity;

            // Save product details for the receipt
            $productDetails[] = [
                'name' => $product['name'],
                'quantity' => $quantity,
                'price' => $price,
                'total' => $price * $quantity
            ];
        }
    }

    $grandTotal = $amountPaid; // Set grand total as amount paid
    $change = $customerPaid - $amountPaid; // Calculate change

    if ($customerPaid < $amountPaid) {
        echo "<script>alert('Please enter an exact total amount'); window.history.back();</script>";
        exit;
    }

    // Insert transaction details into the database
    foreach ($products as $product) {
        if (isset($product['quantity']) && $product['quantity'] > 0) {
            $productId = $product['id']; // Use the product id
            $productName = $product['name'];
            $quantity = $product['quantity'];
            $price = $product['price'];
            $totalAmount = $price * $quantity;
            $size = $product['size']; // Capture the size

            // Insert into checkout_transactions table
            $stmt = $con->prepare("INSERT INTO checkout_transactions (user_id, payment_method, amount_paid, total_amount, `change`, product_name, quantity, size) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
            $stmt->bind_param("issdisss", $userId, $paymentMethod, $customerPaid, $totalAmount, $change, $productName, $quantity, $size);
            $stmt->execute();
            $transactionId = $stmt->insert_id; // Get the last inserted transaction ID
            $stmt->close();

            // Insert into sales table
            $stmtSales = $con->prepare("INSERT INTO sales (product_id, checkout_id, quantity_sold, cups_sold, total_amount, sale_date) VALUES (?, ?, ?, ?, ?, NOW())");
            $stmtSales->bind_param("iiidd", $productId, $transactionId, $quantity, $quantity, $totalAmount);
            $stmtSales->execute();
            $stmtSales->close();

            // Update the stock and cups in the products table using product id
            $stmtUpdate = $con->prepare("UPDATE products SET stock = stock - ?, cups = cups - ? WHERE id = ?");
            $stmtUpdate->bind_param("iis", $quantity, $quantity, $productId); // Use $productId here
            $stmtUpdate->execute();
            $stmtUpdate->close();
        }
    }

    // Store necessary data in session for use in receipt.php
    $_SESSION['receipt'] = [
        'payment_method' => $paymentMethod,
        'amount_paid' => $customerPaid,
        'grand_total' => $grandTotal,
        'change' => $change,
        'products' => $productDetails
    ];

    // Redirect to receipt.php
    header("Location: receipt.php");
    exit;
}

$sql = "SELECT * FROM products";
$dashboard = $con->query($sql) or die($con->error);
if ($dashboard->num_rows == 0) {
    echo "No products found.";
    exit;
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=General+Sans:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/dashboard.css">
    <script src="js/calculateTotal.js"></script>
    <script src="js/confirmationdialog.js"></script>
    <script src="js/qrcodemanipulate.js"></script>
    <style>
        .status-Available { color: green; }
        .status-Not-Available { color: red; }
        .out-stock { color: orange; font-weight: bold; }
        #qrCodeSection { display: none; }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <aside class="sidebar">
            <div class="logo">
                <img src="img/logo.png" alt="BasTeakoy Logo">
                <h2>Menu</h2>
            </div>
            <nav>
                <ul>
                    <li><a href="index.php" onclick="showSection('home')">Home</a></li>
                    <li><a href="utilities.php" onclick="showSection('utilities')">Utilities</a></li>
                    <li><a href="products.php" onclick="showSection('products')">Products</a></li>
                    <li><a href="sales.php" onclick="showSection('sales')">Sales</a></li>
                    <li><a href="attendance.html" onclick="showSection('attendance')">Attendance</a></li>
                </ul>
            </nav>
            <div class="logout">
                <a href="logout.php">Log out</a>
            </div>
        </aside>
        <main class="main-content">
            <header class="dashboard-header">
                <h1>Admin Dashboard</h1>
            </header>
            <section id="dashboardContent" class="dashboard-content home-background">
                <div id="home" class="section active">
                    <h2>Product List</h2>
                    <form method="POST" action="index.php" onsubmit="return validateCheckout(event)">
                        <table>
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Category</th>
                                    <th>Size</th>
                                    <th>Price</th>
                                    <th>Status</th>
                                    <th>Qty</th>
                                    <th>Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php while ($row = $dashboard->fetch_assoc()): ?>
                                <tr>
                                    <td><?php echo htmlspecialchars($row['name']); ?></td>
                                    <td><?php echo htmlspecialchars($row['category']); ?></td>
                                    <td><?php echo htmlspecialchars($row['size']); ?></td>
                                    <td class="price"><?php echo htmlspecialchars($row['price']); ?></td>
                                    <td class="<?php echo $row['status'] == 'Available' ? 'status-Available' : 'status-Not-Available'; ?>">
                                        <?php echo htmlspecialchars($row['status']); ?>
                                    </td>
                                    <td>
                                        <?php if ($row['status'] == 'Available'): ?>
                                        <select name="products[<?php echo $row['id']; ?>][quantity]" class="quantity" onchange="calculateTotal(this)">
                                            <?php for ($i = 0; $i <= 10; $i++): ?>
                                            <option value="<?php echo $i; ?>"><?php echo $i; ?></option>
                                            <?php endfor; ?>
                                        </select>
                                        <?php endif; ?>
                                        <?php if ($row['stock'] == 0 || $row['cups'] == 0): ?>
                                            <span class="out-stock">Out of stock</span>
                                        <?php endif; ?>
                                    </td>
                                    <td class="product-total">0.00</td>
                                    <input type="hidden" name="products[<?php echo $row['id']; ?>][id]" value="<?php echo $row['id']; ?>"> <!-- Hidden product ID -->
                                    <input type="hidden" name="products[<?php echo $row['id']; ?>][name]" value="<?php echo $row['name']; ?>">
                                    <input type="hidden" name="products[<?php echo $row['id']; ?>][price]" value="<?php echo $row['price']; ?>">
                                    <input type="hidden" name="products[<?php echo $row['id']; ?>][size]" value="<?php echo $row['size']; ?>"> <!-- Hidden size field -->
                                </tr>
                                <?php endwhile; ?>
                            </tbody>
                        </table>
                        <div class="total-summary">
                            <h3>Total: <span id="totalValue">0.00</span></h3>
                        </div>
                        <label for="payment_method">Choose Payment Method:</label>
                        <select name="payment_method" id="payment_method" onchange="toggleQRCode()">
                            <option value="cash">Cash</option>
                            <option value="gcash">GCash</option>
                        </select>
                        <div id="qrCodeSection">
                            <h3>Scan the QR Code</h3>
                            <img src="img/qrcode1.png" alt="GCash QR Code">
                            <p>GCash Number: 09275436927</p>
                        </div>
                        <label for="customer_paid">Amount Paid:</label>
                        <input type="number" name="customer_paid" id="customer_paid" required>
                        <button type="submit">Checkout</button>
                    </form>
                </div>
            </section>
        </main>
    </div>
</body>
</html>
