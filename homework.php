<?php
session_start();
if($_SESSION["access"] !=null && $_SESSION["name"]!=null && $_SESSION["id"]!=null && $_SESSION["access"]==0) { 

  $username = $_SESSION["name"];
  $id = $_SESSION["id"];

  $servername = "localhost";
  $username_db = "root";
  $password_db = "";
  $dbname = "asimos";
  $conn = new mysqli($servername, $username_db, $password_db, $dbname);

  if ($conn->connect_error) {
      die("Connection failed: " . $conn->connect_error);
  }

  // Student row
  $sql = "SELECT * FROM student_info WHERE id='$id'";
  $result = $conn->query($sql);
  $row = $result->fetch_assoc();

  // Notifications
  $notificationSql = "SELECT * FROM notification WHERE id='$id'";
  $notificationRes = $conn->query($notificationSql);
  $notification = [];
  if($notificationRes->num_rows > 0) {
    while ($nrow = $notificationRes->fetch_assoc()) {
      $ntnrow[] = $nrow['notification'];
      $ntnFrm[] = $nrow['sentBy'];
    }
    $notification = array_combine($ntnFrm , $ntnrow);
  } else {
    $notification["System"] = "No Notifications";
  }

  // Homework date (selected or today)
  $date = $_GET['date'] ?? date("Y-m-d");

?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Asimos - Homework</title>
  <meta content="Asimos Homework" name="description">
  <meta content="Asimos Homework" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700|Nunito:300,400,600,700|Poppins:300,400,500,600,700" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">

  <link href="assets/css/style.css" rel="stylesheet">
</head>

<body>

  <!-- ======= Header ======= -->
  <?php include("partials/header.php"); ?>
  <!-- ======= Sidebar ======= -->
  <?php include("partials/sidebar.php"); ?>

  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Homework</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="dashboard.php">Home</a></li>
          <li class="breadcrumb-item active">Homework</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section dashboard">
      <div class="row">

        <div class="col-12">
          <div class="card recent-sales overflow-auto">

            <div class="card-body">
              <h5 class="card-title">📘 Homework <span>| <?php echo htmlspecialchars($date); ?></span></h5>

              <!-- Date Selector -->
              <form method="get" action="homework.php" class="form-inline mb-3">
                <label for="date" class="mr-2">Select Date:</label>
                <input type="date" class="form-control mr-2" id="date" name="date" 
                       value="<?php echo htmlspecialchars($date); ?>">
                <button type="submit" class="btn btn-primary">View</button>
              </form>

              <table class="table table-striped table-bordered datatable">
                <thead class="table-dark">
                  <tr>
                    <th>Subject</th>
                    <th>Homework</th>
                    <th>Description</th>
                  </tr>
                </thead>
                <tbody>
                  <?php
                  $stmt = $conn->prepare("
                      SELECT h.subject_name AS subject, h.title, h.description
                      FROM homeworks h
                      JOIN student_info si 
                          ON si.standard = h.standard AND si.section = h.section
                      WHERE si.id = ? AND h.date = ?
                  ");
                  $stmt->bind_param("is", $id, $date);
                  $stmt->execute();
                  $result = $stmt->get_result();

                  if ($result && $result->num_rows > 0) {
                      while ($hw = $result->fetch_assoc()) {
                          echo "<tr>
                                  <td>{$hw['subject']}</td>
                                  <td>{$hw['title']}</td>
                                  <td>{$hw['description']}</td>
                                </tr>";
                      }
                  } else {
                      echo "<tr><td colspan='3' class='text-center'>No homework for this date</td></tr>";
                  }
                  ?>
                </tbody>
              </table>

            </div>
          </div>
        </div>

      </div>
    </section>

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">
    <div class="copyright">
      &copy; <strong><span>Asimos</span></strong> All Rights Reserved
    </div>
  </footer>

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center">
    <i class="bi bi-arrow-up-short"></i>
  </a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="assets/js/main.js"></script>

</body>
</html>
<?php
} else {
  header("Location: error-404.html");
}
?>
