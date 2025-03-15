<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "worldcountries";
$conn = new mysqli($servername, $username, $password, $dbname);
$conn->set_charset("utf8");

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
// Getting a search query by URL
$query = isset($_GET['query']) ? trim($_GET['query']) : '';
if ($query) {
    // SQL query to search continents, countries and country notes tables
    $sql = "
        SELECT 'continent' AS table_name, name AS field_name, description AS additional_info 
        FROM continent 
        WHERE name LIKE ? OR description LIKE ?
        UNION ALL
        SELECT 'country' AS table_name, country_name AS field_name, capital AS additional_info 
        FROM country 
        WHERE country_name LIKE ? OR capital LIKE ? OR official_language LIKE ?
        UNION ALL
        SELECT 'countrynotes' AS table_name, titlenotes AS field_name, description AS additional_info 
        FROM countrynotes 
        WHERE titlenotes LIKE ? OR description LIKE ?
    ";
    $stmt = $conn->prepare($sql);
    $likeQuery = '%' . $query . '%';
    $stmt->bind_param('sssssss', $likeQuery, $likeQuery, $likeQuery, $likeQuery, $likeQuery, $likeQuery, $likeQuery);
    $stmt->execute();
    $result = $stmt->get_result();
    // Generate HTML code with search results
    if ($result->num_rows > 0) {

        echo "<table border='1' cellpadding='10'>";
        echo "<tr>
                <th>Table - Field Name >>  Additional Info</th>
              </tr>";
        while ($row = $result->fetch_assoc()) {
            echo "<tr>
                    <td><em>" . htmlspecialchars($row['table_name']) . " - " . htmlspecialchars($row['field_name']) . ">> </em>" . htmlspecialchars($row['additional_info']) . "</td>
                  </tr>";
        }
        echo "</table>";
    } else {
        echo "<p>No results found.</p>";
    }
} else {
    echo "<p>No search query provided.</p>";
}
$conn->close();
?>
