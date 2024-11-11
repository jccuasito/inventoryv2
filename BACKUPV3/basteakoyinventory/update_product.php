<?php
include_once("connections/connection.php");
$con = connection();

session_start(); // Start the session to access current user ID
$user_id = $_SESSION['user_id']; // Assuming the user ID is stored in the session

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id = $_POST['id'];
    $name = $_POST['name'];
    $category = $_POST['category'];
    $size = $_POST['size'];
    $cups = $_POST['cups'];
    $price = $_POST['price'];
    $stock = $_POST['stock'];
    $status = $_POST['status'];
    $invested_price = $_POST['invested_price']; // Capture invested price

    // Debugging: Check POST data
    echo '<pre>';
    print_r($_POST); // Display the form data
    echo '</pre>';

    // Check if the product ID is set for update or it's a new product (insert)
    if (empty($id)) {
        // Insert statement
        $sql = "INSERT INTO products (name, category, size, cups, price, stock, status, invested_price, edit_by, last_editby) 
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        $stmt = $con->prepare($sql);
        $last_editby = NULL;
        $stmt->bind_param("sssdissdii", $name, $category, $size, $cups, $price, $stock, $status, $invested_price, $user_id, $last_editby);
    } else {
        // Get the current product's 'edit_by' to set it as 'last_editby'
        $getProductQuery = "SELECT edit_by FROM products WHERE id = ?";
        $getProductStmt = $con->prepare($getProductQuery);
        $getProductStmt->bind_param("i", $id);
        $getProductStmt->execute();
        $result = $getProductStmt->get_result();
        $product = $result->fetch_assoc();

        // Get the previous editor (edit_by) to set as last_editby
        $last_editby = ($product['edit_by'] !== NULL) ? $product['edit_by'] : NULL;

        // Update the product, set 'edit_by' to current user and 'last_editby' to previous user
        $sql = "UPDATE products 
                SET name=?, category=?, size=?, cups=?, price=?, stock=?, status=?, invested_price=?, 
                    edit_by=?, last_editby=? 
                WHERE id=?";
        $stmt = $con->prepare($sql);
        $stmt->bind_param("sssdissdiii", $name, $category, $size, $cups, $price, $stock, $status, $invested_price, $user_id, $last_editby, $id);
    }

    // Execute the prepared statement
    if ($stmt->execute()) {
        echo "<script>alert('Product added/updated successfully. Refresh the page to see changes.'); window.location.href = 'products.php';</script>";
    } else {
        echo "Error: " . $stmt->error; // Error handling if statement fails
    }
}
