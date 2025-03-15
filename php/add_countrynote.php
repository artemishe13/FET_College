<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "worldcountries";

// Создаем подключение
$conn = new mysqli($servername, $username, $password, $dbname);

// Проверяем подключение
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $country_id = $_POST["country_id"];
    $titlenotes = $_POST["titlenotes"];
    $description = $_POST["description"];
    $link = $_POST["link"];

    // Обработка загрузки изображения
    $link_img = "";
    if(isset($_FILES['image']) && $_FILES['image']['error'] == 0) {
        $upload_dir = '../img/stories/';
        $file_name = basename($_FILES['image']['name']);
        $target_path = $upload_dir . $file_name;
        
        if(move_uploaded_file($_FILES['image']['tmp_name'], $target_path)) {
            $link_img = $target_path;
        } else {
            echo "Ошибка при загрузке файла.<br>";
        }
    }

    // Используем подготовленные выражения для защиты от SQL-инъекций
    $sql = "INSERT INTO countrynotes (country_id, titlenotes, description, link_img, link) VALUES (?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);

    if ($stmt === false) {
        die("Ошибка подготовки запроса: " . $conn->error);
    }

    // "issss" - integer, string, string, string, string
    $stmt->bind_param("issss", $country_id, $titlenotes, $description, $link_img, $link);

    if ($stmt->execute()) {
        echo "New record created successfully";
    } else {
        echo "Error: " . $stmt->error;
    }

    $stmt->close();
}

$conn->close();
?>
