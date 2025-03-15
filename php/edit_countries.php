<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/style.css">
    <title>Edit Countries</title>
    <h3>Edit Countries</h3>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<div class="topnav">
    <a href="../index.html">Home</a>
    <a href="continents.php">Continents</a>
    <a href="countries.php">Countries</a>
    <a href="stories.php">Stories country</a>
    <a class="active" href="edit_countries.php">Edit Countries</a>
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
?>

<form action="edit_countries.php" method="post">
    <table>
        <tr>
            <td>Continent</td>
            <td>
                <select name="continent_id" id="continent_select">
                    <option value="">Select Continent</option>
                    <?php
                    $sql = "SELECT continent_id, name FROM continent ORDER BY name";
                    $result = $conn->query($sql);

                    if ($result->num_rows > 0) {
                        while ($row = $result->fetch_assoc()) {
                            echo "<option value='" . $row['continent_id'] . "'>" . htmlspecialchars($row['name'], ENT_QUOTES, 'UTF-8') . "</option>";
                        }
                    }
                    ?>
                </select>
            </td>
        </tr>
        <tr>
            <td>Country</td>
            <td>
                <select name="country_id" id="country_select">
                    <option value="">Select Country</option>
                </select>
            </td>
        </tr>
        <tr><td>Country Name </td><td><input type="text" name="country_name" id="country_name"></td></tr>
        <tr><td>Capital</td><td><input type="text" name="capital" id="capital"></td></tr>
        <tr><td>Population</td><td><input type="text" name="population" id="population"></td></tr>
        <tr><td>Country Area</td><td><input type="text" name="country_area" id="country_area"></td></tr>
        <tr><td>Country Date (YYYY-MM-DD)</td><td><input type="text" name="country_date" id="country_date"></td></tr>
		<tr><td>Official Language</td><td><input type="text" name="official_language" id="official_language"></td></tr>
        <tr><td colspan="2"><input type="submit" value="Update Country"></td></tr>
    </table>
</form>

<script>
    $(document).ready(function() {
        $('#continent_select').change(function() {
            var continent_id = $(this).val();
            $.ajax({
                url: 'get_countries.php',
                method: 'POST',
                data: {continent_id: continent_id},
                success: function(data) {
                    $('#country_select').html(data);
                },
                error: function(xhr, status, error) {
                    console.error("AJAX Error: " + status + "\nError: " + error);
                    console.log("Response Text: " + xhr.responseText);
                }
            });
        });

        $('#country_select').change(function() {
            var country_id = $(this).val();
            $.ajax({
                url: 'get_country_details.php',
                method: 'POST',
                data: {country_id: country_id},
                dataType: 'json',
                success: function(data) {
                    $('#country_name').val(data.country_name);
                    $('#capital').val(data.capital);
                    $('#population').val(data.population);
                    $('#country_area').val(data.country_area);
                    $('#country_date').val(data.country_date);
					$('#official_language').val(data.official_language);
                },
                error: function(xhr, status, error) {
                    console.error("AJAX Error: " + status + "\nError: " + error);
                    console.log("Response Text: " + xhr.responseText);
                }
            });
        });
    });
</script>

<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $country_id = isset($_POST['country_id']) ? $_POST['country_id'] : '';
    $country_name = isset($_POST['country_name']) ? $_POST['country_name'] : '';
    $capital = isset($_POST['capital']) ? $_POST['capital'] : '';
    $population = isset($_POST['population']) ? $_POST['population'] : '';
    $country_area = isset($_POST['country_area']) ? $_POST['country_area'] : '';
    $country_date = isset($_POST['country_date']) ? $_POST['country_date'] : '';
    $continent_id = isset($_POST['continent_id']) ? $_POST['continent_id'] : '';
	$official_language = isset($_POST['official_language']) ? $_POST['official_language'] : '';

	$sql = "UPDATE country SET country_name=?, capital=?, population=?, country_area=?, country_date=?, continent_id=?, official_language=? WHERE country_id=?";

	$stmt = $conn->prepare($sql);
	$stmt->bind_param("sssssssi", $country_name, $capital, $population, $country_area, $country_date, $continent_id, $official_language, $country_id);

    if ($stmt->execute()) {
        echo "Record updated successfully.";
    } else {
        echo "Error updating record: " . $conn->error;
    }

    $stmt->close();
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
