<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "worldcountries";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$message = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $country_id = $_POST["country_id"];
    $titlenotes = $_POST["titlenotes"];
    $description = $_POST["description"];
    $link = $_POST["link"];

    $link_img = "";
    if(isset($_FILES['image']) && $_FILES['image']['error'] == 0) {
        $upload_dir = '../img/stories/';
        $file_name = basename($_FILES['image']['name']);
        $target_path = $upload_dir . $file_name;
        
        if(move_uploaded_file($_FILES['image']['tmp_name'], $target_path)) {
            $link_img = $target_path;
        } else {
            $message = "Error loading file.";
        }
    }

    $sql = "INSERT INTO countrynotes (country_id, titlenotes, description, link_img, link) VALUES (?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);

    if ($stmt === false) {
        $message = "Error preparing request: " . $conn->error;
    } else {
        $stmt->bind_param("issss", $country_id, $titlenotes, $description, $link_img, $link);

        if ($stmt->execute()) {
            $message = "The entry was added successfully.";
        } else {
            $message = "Error: " . $stmt->error;
        }

        $stmt->close();
    }
}

$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/style.css">
    <title>Add New Country Note</title>
    <style>
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.4);
        }
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            max-width: 500px;
        }
    </style>
</head>
<body>
<div class="topnav">
  <a href="../index.html">Home</a>
  <a href="continents.php">Continents</a>
  <a href="countries.php">Countries</a>
  <a href="stories.php">Stories country</a>
  <a href="edit_countries.php">Edit Countries</a>
  <a class="active" href="input_stories.php">Input Stories</a>
  <a href="resources.php">Resources</a>
  <input type="text" id="searchInput" placeholder="Search the database.." onkeydown="handleSearch(event)">
</div>
<h2>Add New Country Note</h2>
<div class="dive_margin">
    

<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "worldcountries";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Processing file upload
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_FILES['image'])) {
    $uploadDir = '../img/stories/';
    $fileName = basename($_FILES['image']['name']);
    $targetFilePath = $uploadDir . $fileName;

    if (move_uploaded_file($_FILES['image']['tmp_name'], $targetFilePath)) {
        $sql = "INSERT INTO images (file_path) VALUES (?)";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("s", $targetFilePath);
        if ($stmt->execute()) {
            echo "<p>The file has been successfully uploaded and the path has been saved in the database.</p>";
        } else {
            echo "<p>Error saving path to database: " . $conn->error . "</p>";
        }
        $stmt->close();
    } else {
        echo "<p>Error loading file.</p>";
    }
}
?>
    <form method="post" action="" enctype="multipart/form-data">
            <label for="country_id">Country:</label>
    <select name="country_id" id="country_id" required>
        <?php
        $sql = "SELECT country_id, country_name FROM country ORDER BY country_name";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
                echo '<option value="' . htmlspecialchars($row["country_id"]) . '">' . htmlspecialchars($row["country_name"]) . '</option>';
            }
        } else {
            echo '<option value="">No countries found</option>';
        }
        ?>
    </select><br><br>

    <label for="titlenotes">Title:</label>
    <input type="text" name="titlenotes" id="titlenotes" required><br><br>

    <label for="description">Description:</label>
    <textarea name="description" id="description" rows="4" cols="50" required></textarea><br><br>

    <label for="link">Link:</label>
    <input type="url" name="link" id="link"><br><br>
    
    <label for="image">Select image:</label>
    <input type="file" name="image" id="image" required><br><br>

    <input type="submit" value="Submit">
    </form>
</div>

<div id="myModal" class="modal">
    <div class="modal-content">
        <p id="modalMessage"></p>
    </div>
</div>

<script>
var modal = document.getElementById("myModal");
var modalMessage = document.getElementById("modalMessage");

<?php if (!empty($message)): ?>
window.onload = function() {
    modalMessage.innerHTML = "<?php echo $message; ?>";
    modal.style.display = "block";
    
    setTimeout(function() {
        modal.style.display = "none";
    }, 2000);
}
<?php endif; ?>

window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>

<div id="searchModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeSearchModal()">&times;</span>
        <div id="modalResults">
        </div>
    </div>
</div>

<div id="imageModal" class="modal-image">
    <span class="close-image" onclick="closeModal()">&times;</span>
    <img class="modal-content-image" id="img01">
</div>
<script src="../js/Backgrounds.js"></script>
<script src="../js/Search.js"></script>
</body>
</html>
