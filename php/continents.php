<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Сontinents</title>
 	<link rel="stylesheet" href="../css/style.css?v=1">
	<style>

	</style>
</head>
<body>
<div class="topnav">
 <a  href="../index.html">Home</a>
  <a class="active" href="continents.php">Continents</a>
  <a href="countries.php">Countries</a>
  <a href="stories.php">Stories country</a>
  <a href="edit_countries.php">Edit Countries</a>
  <a href="input_stories.php">Input Stories</a>
  <a href="resources.php">Resources</a>
  <input type="text" id="searchInput" placeholder="Search the database.." onkeydown="handleSearch(event)">
</div>

<div class="dive_margin" >

<?php
function getImagesFromDir($dir) {
    $images = [];
    $files = scandir($dir);
    foreach ($files as $file) {
        if ($file !== "." && $file !== "..") {
            $filePath = $dir . "/" . $file;
            $fileExtension = strtolower(pathinfo($file, PATHINFO_EXTENSION));
            if (in_array($fileExtension, ['jpg', 'jpeg', 'png', 'gif'])) {
                $images[] = $filePath;
            }
        }
    }
    return $images;
}

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "worldcountries";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT c.continent_id, c.name, c.area, c.description, 
               COUNT(co.country_id) as country_count,
               SUM(co.population) as total_population
        FROM continent c
        LEFT JOIN country co ON c.continent_id = co.continent_id
        GROUP BY c.continent_id, c.name, c.area, c.description";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    echo "<style>
        th:nth-child(1) { width: 8%; }
        th:nth-child(2) { width: 20%; }
        th:nth-child(3) { width: 7%; }
        th:nth-child(4) { width: 40%; }
        th:nth-child(5) { width: 8%; }
        th:nth-child(6) { width: 8%; }
    </style>";

    echo "<table>";
    echo "<tr>
            <th>Continent ID</th>
            <th>Name</th>
            <th>Area <br>(million km²)</p></th>
            <th>Description</th>
            <th>Number of Countries</th>
            <th>Population <br>(million people)</th>
          </tr>";

    while($row = $result->fetch_assoc()) {
        $imageDir = "../img/" . $row["name"]; // Папка с изображениями
        $images = getImagesFromDir($imageDir); // Получаем массив изображений

        echo "<tr>
                <td>".$row["continent_id"]."</td>
                <td>".$row["name"]."
                <img src='../img/".$row["name"]."/".$row["name"].".png' title='images' style='width: 85%;' 
                     data-folder='".$imageDir."' >
                </td>
                <td>".$row["area"]."</td>
                <td>".$row["description"]."</td>
                <td>".$row["country_count"]."</td>
                <td>".number_format($row["total_population"])."</td>
              </tr>";
    }

    echo "</table>";
} else {
    echo "0 results";
}

$conn->close();
?>

</div>



<div id="modal" class="modal">
  <span class="close">&times;</span>
  <img class="modal-content" id="modal-image">
  <div class="modal-navigation">
    <button id="prev-image">&lt;</button>
    <button id="next-image">&gt;</button>
  </div>
</div>

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
<script>
//img navigation
document.addEventListener('DOMContentLoaded', function() {
  const images = document.querySelectorAll('.category img, table img'); // Combining selectors
  const modal = document.getElementById('modal');
  const modalImage = document.getElementById('modal-image');
  const prevImageBtn = document.getElementById('prev-image');
  const nextImageBtn = document.getElementById('next-image');
  const closeBtn = document.querySelector('.close');
  let currentImageIndex = 0;
  let currentImagesArray = [];

  function loadImagesFromFolder(folderPath) {
    return fetch(folderPath)
      .then(response => response.text())
      .then(html => {
        const parser = new DOMParser();
        const doc = parser.parseFromString(html, 'text/html');
        const links = Array.from(doc.querySelectorAll('a'));
        return links
          .filter(link => /\.(jpg|jpeg|png|gif)$/i.test(link.href))
          .map(link => folderPath + '/' + link.textContent.trim());
      });
  }

  images.forEach(img => {
    img.addEventListener('click', function() {
      const folderPath = this.dataset.folder;
      loadImagesFromFolder(folderPath).then(images => {
        currentImagesArray = images;
        currentImageIndex = 0;
        modalImage.src = currentImagesArray[currentImageIndex];
        modal.style.display = 'block';
      });
    });
  });

  prevImageBtn.addEventListener('click', function() {
    currentImageIndex = (currentImageIndex - 1 + currentImagesArray.length) % currentImagesArray.length;
    modalImage.src = currentImagesArray[currentImageIndex];
  });

  nextImageBtn.addEventListener('click', function() {
    currentImageIndex = (currentImageIndex + 1) % currentImagesArray.length;
    modalImage.src = currentImagesArray[currentImageIndex];
  });

  closeBtn.addEventListener('click', function() {
    modal.style.display = 'none';
  });

  window.addEventListener('click', function(event) {
    if (event.target === modal) {
      modal.style.display = 'none';
    }
  });
});

</script>

<script src="../js/Backgrounds.js"></script>
<script src="../js/Search.js"></script>
</body>
</html>
