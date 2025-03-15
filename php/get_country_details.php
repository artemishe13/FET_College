<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "worldcountries";

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$country_id = $_POST['country_id'];

$sql = "SELECT country_name, capital, population, country_area, country_date, official_language FROM country WHERE country_id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $country_id);
$stmt->execute();
$result = $stmt->get_result();

$data = $result->fetch_assoc();

header('Content-Type: application/json; charset=utf-8'); // Adding Content-Type
echo json_encode($data, JSON_UNESCAPED_UNICODE); // JSON_UNESCAPED_UNICODE for correct display of Cyrillic

$stmt->close();
$conn->close();
?>
