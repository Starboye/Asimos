<?php
session_start();

function updatePassword($id ,$username, $oldPassword, $newPassword, $conn) {
    $id = mysqli_real_escape_string($conn, $id);
    $username = mysqli_real_escape_string($conn, $username);
    $oldPassword = mysqli_real_escape_string($conn, $oldPassword);
    $newPassword = mysqli_real_escape_string($conn, $newPassword);

    $checkOldPasswordQuery = "SELECT * FROM user_login WHERE name='$username' AND id='$id' AND password='$oldPassword'";
    $result = mysqli_query($conn, $checkOldPasswordQuery);

    if ($result && mysqli_num_rows($result) > 0) {
        $updatePasswordQuery = "UPDATE user_login SET password='$newPassword' WHERE name='$username' AND id='$id'";
        $updateResult = mysqli_query($conn, $updatePasswordQuery);

        if ($updateResult) {
            echo '<script>alert("Password updated successfully.");  window.location.href = "../users-profile.php";</script>';
        } else {
            echo '<script>alert("Error updating password. Please try again."); window.location.href = "../users-profile.php";</script>';
        }
    } else {
        echo '<script>alert("Incorrect old password. Please enter the correct old password."); window.location.href = "../users-profile.php";</script>';
    }
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && $_SESSION['id']!=null && $_SESSION['name']!=null) {
    $username = $_SESSION["name"];
    $id = $_POST["id"];
    $oldPassword = $_POST["currentPassword"];
    $newPassword = $_POST["newPassword"];

    $conn = mysqli_connect("localhost", "root", "", "asimos");

    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }

    updatePassword($id ,$username, $oldPassword, $newPassword, $conn);

    mysqli_close($conn);
}
else{
    header("Location: ../error-404.html");
}
?>
