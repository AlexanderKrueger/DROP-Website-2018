<?php
/* Create the PDO object */
$dsn = 'mysql:host=localhost; dbname=dropx103_resource_db';
$userName = 'dropx103';
$passWord = 'som3thingsom3thing';

try {
    $db = new PDO($dsn, $userName, $passWord);
} catch (PDOException $e) {
    $error_message = $e->getMessage();
    echo "<p>Connection failed: $error_message</p>";
}

/* Query Resource Information */
$resourceQuery = 'SELECT ResourceName, PhoneNUMBER
                  FROM Resources
                  WHERE Resources.ResourceName = :resource_name AND Resources.PhoneNUMBER = :phone_number
                  LIMIT 1';
$resourceStatement = $db->prepare($resourceQuery);
$resourceStatement->execute(array(':resource_name' => $_GET['ResourceName'], ':phone_number' => $_GET['PhoneNUMBER']));
$resources = $resourceStatement->fetchAll();
$resourceStatement->closeCursor();
?>

<!DOCTYPE HTML>
<html>
    <head>
        <title>
          Resource Page
        </title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- JQuery -->
<!--        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>-->

        <!-- Latest compiled and minified JavaScript -->
<!--        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>-->
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

        <style>
            .btn-bottom-margin { margin-bottom: 1em }
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-12">
                    <div class="jumbotron" style="margin-top:1em">
                    <h1><?php echo htmlspecialchars(rawurldecode($_GET['ResourceName'])) ?></h1>
                    <p id="resource-description">
                    Bacon ipsum dolor amet pork chop ribeye jerky sirloin rump                           chuck. Sirloin jerky pork belly fatback brisket rump kevin                           shankle prosciutto. Pork chop capicola filet mignon alcatra                         brisket spare ribs. Kevin shank meatloaf pork, ham hock alcatra                     ground round bacon boudin beef ribs filet mignon.
                    </p>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-6 btn-bottom-margin" tabindex="0" role="link" label>
                    <a href="#" class="btn btn-primary btn-block" style="text-align:left"><span class="glyphicon glyphicon-globe"></span> <!-- php echoed => -->www.resource_website.com</a>
                </div>
                <div class="col-sm-6 btn-bottom-margin" tabindex="1" role="button">
                    <a href=<?php echo '"https://www.google.com/maps/place/'.str_replace(' ', '+', $_GET['StreetAddress'].' '.$_GET['StateID'].', '.$_GET['City'].' '.$_GET['Zip']).'"' ?> class="btn btn-primary btn-block" style="text-align:left"><span class="glyphicon glyphicon-map-marker"></span>
                        <?php echo $_GET['StreetAddress'].' '.$_GET['StateID'].', '.$_GET['City'].' '.$_GET['Zip'] ?>
                    </a>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 btn-bottom-margin" tabindex="2" role="button">
                    <a href=<?php echo '"mailto:'.$_GET['Email'].'"'?> class="btn btn-primary btn-block" style="text-align:left"><span class="glyphicon glyphicon-envelope"></span><?php echo $_GET['Email']?></a>
                </div>
                <div class="col-sm-6 btn-bottom-margin" tabindex="2" role="button">
                    <a href=<?php echo '"tel:'.htmlspecialchars(rawurldecode($_GET['PhoneNUMBER'])).'"'?> class="btn btn-primary btn-block" style="text-align:left"><span class="glyphicon glyphicon-earphone"></span> <?php echo htmlspecialchars(rawurldecode($_GET['PhoneNUMBER'])) ?></a>
                </div>
            </div>
        </div><!-- container end -->

        <script>
        <?php echo file_get_contents(__DIR__.'\\bootstrap.native-master\\dist\\bootstrap-native.min.js') ?>
        </script>
    </body>
</html>
