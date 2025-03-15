<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Source</title>
	<link rel="stylesheet" href="../css/style.css">
	<style>

	</style>
</head>
<body>
<div class="topnav">
  <a href="../index.html">Home</a>
  <a href="continents.php">Continents</a>
  <a href="countries.php">Countries</a>
  <a class="active" href="stories.php">Stories country</a>
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

//Request to get continents
$continent_sql = "SELECT * FROM continent ORDER BY name";
$continent_result = $conn->query($continent_sql);

if ($continent_result->num_rows > 0) {
    echo "<style>
		th,td {
		overflow-x: auto;
		background-color: rgba(52, 147, 175, 0.5);
		}
		th:nth-child(1) { width: 10%; } /* location */
		th:nth-child(2) { width: 25%; } /* Title */
		th:nth-child(3) { width: 60%; } /* Description */
    </style>";

    echo "<table>
            <tr>
                <th>Location</th>
                <th>Title</th>
				<th>Description</th>
            </tr>";

    while($continent_row = $continent_result->fetch_assoc()) {
        $continent_id = $continent_row["continent_id"];

        // Query to get countries belonging to a given continent
        $country_sql = "SELECT country_id, country_name FROM country WHERE continent_id = '$continent_id' ORDER BY country_name";
        $country_result = $conn->query($country_sql);

        if ($country_result->num_rows > 0) {
            while($country_row = $country_result->fetch_assoc()) {
                $country_id = $country_row["country_id"];
                $country_name = $country_row["country_name"];
                // Request for country notes
                $countrynotes_sql = "SELECT titlenotes, description, link_img, link FROM countrynotes WHERE country_id = '$country_id'";
                $countrynotes_result = $conn->query($countrynotes_sql);

                if ($countrynotes_result->num_rows > 0) {
                    while($countrynotes_row = $countrynotes_result->fetch_assoc()) {
                        $titlenotes = htmlspecialchars($countrynotes_row["titlenotes"]);
                        $description = htmlspecialchars($countrynotes_row["description"]);
						$link_img = $countrynotes_row["link_img"];
                        $link = htmlspecialchars($countrynotes_row["link"]);
                        

                        echo "<tr>";
                        echo "<td>" . htmlspecialchars($continent_row["name"]) . " - "
                         . htmlspecialchars($country_name) . "</td>";
                        echo "<td>";
						 echo "<p>" . $titlenotes . "</p>";
						 echo "<img src='" . $link_img . "' title='" . $link_img . "' style='width: 80%;' onclick='openModal(this)'>";
                        
                        echo "</td>";
						 echo "<td>" . $description . "<br><a href='" . $link . "' target='_blank'>" . $link . "</a></td>";
                        echo "</tr>";
                    }
                }
            }
        }
    }

    echo "</table>";
} else {
  echo "There are no continents";
}

$conn->close();
?>
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
