<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

 	<link rel="stylesheet" href="../css/style.css">
</head>
<body>
<div class="topnav">
  <a href="../index.html">Home</a>
  <a href="continents.php">Continents</a>
  <a href="countries.php">Countries</a>
  <a href="stories.php">Stories country</a>
  <a href="edit_countries.php">Edit Countries</a>
  <a href="input_stories.php">Input Stories</a>
  <a class="active" href="Resources.php">Resources</a>
  <input type="text" id="searchInput" placeholder="Search the database.." onkeydown="handleSearch(event)">
</div>
<p>
Resources
 background-image: url('../img/Earth-planet-asteroid-sci-fi.jpg');
https://geology.com/world/asia-satellite-image.shtml
</p>
    <div class="category">
  <img src="../img/Parts of the world.png" alt="Parts of the world" data-folder="../img">
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
<script src="../js/Backgrounds.js"></script>
<script src="../js/Search.js"></script>
</body>

</html>
