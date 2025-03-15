<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Countries</title>
 	<link rel="stylesheet" href="../css/style.css?v=1">
	<style>


	</style>
</head>
<body>
<div class="topnav">
  <a href="../index.html">Home</a>
  <a href="continents.php">Continents</a>
  <a class="active" href="countries.php">Countries</a>
  <a href="stories.php">Stories country</a>
  <a href="edit_countries.php">Edit Countries</a>
  <a href="input_stories.php">Input Stories</a>
  <a href="resources.php">Resources</a>
  <input type="text" id="searchInput" placeholder="Search the database.." onkeydown="handleSearch(event)">
</div>

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

// Request to get continents
$continent_sql = "SELECT * FROM continent ORDER BY name";
$continent_result = $conn->query($continent_sql);

if ($continent_result->num_rows > 0) {
	echo "<style>
        th:nth-child(1) { width: 15%; } /* Continent ID*/
        th:nth-child(2) { width: 15%; } /* Continent ID*/
		th:nth-child(3) { width: 15%; } /* Name */
		th:nth-child(4) { width: 15%; } /* Area */
		th:nth-child(5) { width: 15%; } /* Number of Countries */
		th:nth-child(6) { width: 15%; } /* Population */
    </style>";
    // For every continent
    while($continent_row = $continent_result->fetch_assoc()) {
        echo "<h2>" . $continent_row["name"] . "</h2>";
        
        // Query to get countries of the current continent
        $country_sql = "SELECT * FROM country WHERE continent_id = " . $continent_row["continent_id"] . " ORDER BY country_name";
        $country_result = $conn->query($country_sql);
        // Add table headers
		echo "<table>"; 
    echo "<tr>
            <th>Country name</th>
            <th>Capital</th>
            <th>Population (million people)</th>
            <th>Area<p>(million km²)</p></th>
            <th>Country Date</th>
            <th>Official Language</th>
            
          </tr>";
        if ($country_result->num_rows > 0) {
            // Display information about each country
            while($country_row = $country_result->fetch_assoc()) {
               					 
			echo "<tr>
                <td><img src='../img/flag/" . htmlspecialchars($country_row["country_name"]) . ".png' alt='" . htmlspecialchars($country_row["country_name"]) . "' data-folder='../img' style='display: block; margin: 0%;'>" .$country_row["country_name"]."</td>
                <td>".$country_row["capital"]."	</td>
                <td>".$country_row["population"]."</td>
                <td>".$country_row["country_area"]."</td>
                <td>".$country_row["country_date"]."</td>
                <td>".$country_row["official_language"]."</td>
              </tr>"; 					 
			
            }
                echo "</table>";  
        } else {
            echo "There are no countries for this continent";
        }
    }
} else {
    echo "No data on continents";
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

<script src="../js/Backgrounds.js"></script>
<script src="../js/Search.js"></script>
</body>
</html>
