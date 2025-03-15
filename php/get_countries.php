<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "worldcountries";

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$continent_id = isset($_POST['continent_id']) ? $_POST['continent_id'] : (isset($_GET['continent_id']) ? $_GET['continent_id'] : null);

if ($continent_id === null) {
    die("No continent_id provided");
}

$sql = "SELECT country_id, country_name FROM country WHERE continent_id = ? ORDER BY country_name";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $continent_id);
$stmt->execute();
$result = $stmt->get_result();

header('Content-Type: text/html; charset=utf-8'); //Content-Type

echo "<option value=''>Select Country</option>";
while ($row = $result->fetch_assoc()) {
    echo "<option value='" . $row['country_id'] . "'>" . htmlspecialchars($row['country_name'], ENT_QUOTES, 'UTF-8') . "</option>";
}

$stmt->close();
$conn->close();
?>
