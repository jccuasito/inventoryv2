<?php
include_once("connections/connection.php");
$con = connection();

function get_sales_history() {
    global $con;

    // Query the checkout_transactions table
    $sql = "SELECT c.transaction_date AS sale_date, 
                   c.product_name AS product_name, 
                   c.size AS product_size,
                   c.quantity AS quantity_purchased
            FROM checkout_transactions c
            ORDER BY c.transaction_date DESC";
    $result = mysqli_query($con, $sql);
    if (!$result) {
        die("Query failed: " . mysqli_error($con));
    }

    $sales_history = [];
    while ($row = mysqli_fetch_assoc($result)) {
        $sales_history[] = $row;
    }
    return $sales_history;
}

// Get sales history
$sales_history = get_sales_history();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="css/sales.css">
    <script src="js/confirmationdialog.js"></script>
</head>
<body>
    <div class="dashboard-container">
        <!-- Sidebar -->
        <aside class="sidebar">
            <div class="logo">
                <img src="img/logo.png" alt="BasTeakoy">
                <h2>Menu</h2>
            </div>
            <nav>
                <ul>
                    <li><a href="index.php">Home</a></li>
                    <li><a href="utilities.php">Utilities</a></li>
                    <li><a href="products.php">Products</a></li>
                    <li><a href="sales.html">Sales</a></li>
                    <li><a href="attendance.html">Attendance</a></li>
                </ul>
            </nav>
            <div class="logout">
                <a href="logout.png">Log out</a>
            </div>
        </aside>

        <!-- Main Content -->
        <section class="main-content">
            <div class="dashboard-header">
                <h1>ADMIN DASHBOARD</h1>
            </div>

            <div class="sales-report">
                <h2>Sales Report</h2>
                <div class="report-buttons">
                    <button class="report-btn" id="btnToday">Today</button>
                    <button class="report-btn" id="btnThisWeek">This Week</button>
                    <button class="report-btn" id="btnThisMonth">This Month</button>
                    <button class="report-btn" id="btnThisYear">This Year</button>
                </div>

                <div class="sales-summary">
                    <div class="sales-box">
                        <h3>Amount</h3>
                        <p id="amountTotal">₱0.00</p>
                    </div>
                    <div class="sales-box">
                        <h3>Expense</h3>
                        <p id="expenseTotal">₱0.00</p>
                    </div>
                    <div class="sales-box">
                        <h3>Total Product Sold</h3>
                        <p id="productTotal">0</p>
                    </div>
                </div>

                <div class="history-sales">
                    <h3>History Sales</h3>
                    <table id="salesTable">
                        <thead>
                            <tr>
                                <th>Date</th>
                                <th>Products</th>
                                <th>Size</th>
                                <th>Quantity</th> <!-- New column for Quantity -->
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            foreach ($sales_history as $sale) {
                                echo "<tr>";
                                echo "<td>" . date("m/d/Y", strtotime($sale['sale_date'])) . "</td>"; // Format date
                                echo "<td>" . htmlspecialchars($sale['product_name']) . "</td>"; // Display product name safely
                                echo "<td>" . htmlspecialchars($sale['product_size']) . "</td>"; // Display product size safely
                                echo "<td>" . htmlspecialchars($sale['quantity_purchased']) . "</td>"; // Display quantity
                                echo "</tr>";
                            }
                            ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>
    </div>
    <script src="sales.js"></script>
</body>
</html>
