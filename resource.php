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

        <style>.h-underline{text-decoration: underline solid black;}</style>

        <style>
            ::-webkit-scrollbar { background-color: grey;}
            ::-webkit-scrollbar-button { background-color:#337ab7; }
            ::-webkit-scrollbar-track { background-color:#337ab7 }
            ::-webkit-scrollbar-track-piece { background-color:#a1bdde; border-radius: 5px; }
            ::-webkit-scrollbar-thumb { background-color:#337ab7; border-radius:5px;  border-color: #2e6da4; border-style:solid; border-width:1px; }
            ::-webkit-scrollbar-corner { background-color:pink }
            ::-webkit-resizer { background-color:black;color:black; }
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-12">
                    <h2 class="h-underline"><?php echo htmlspecialchars(rawurldecode($_GET['ResourceName'])) ?></h2>
                    <p id="resource-description">
                    Bacon ipsum dolor amet pork chop ribeye jerky sirloin rump                           chuck. Sirloin jerky pork belly fatback brisket rump kevin                           shankle prosciutto. Pork chop capicola filet mignon alcatra                         brisket spare ribs. Kevin shank meatloaf pork, ham hock alcatra                     ground round bacon boudin beef ribs filet mignon.
                    </p>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-6" style="margin-top:1em" tabindex="0" role="link" label>
                    <a href="#" class="btn btn-primary btn-block" style="text-align:left"><span class="glyphicon glyphicon-globe"></span> <!-- php echoed => -->www.resource_website.com</a>
                </div>
                <div class="col-sm-6" style="margin-top:1em" tabindex="1" role="button">
                    <div class="btn btn-primary btn-block" style="text-align:left"><span class="glyphicon glyphicon-map-marker"></span>
                        1111 Some Street
                        WI, SomeCity
                        11111
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6" style="margin-top:1em" tabindex="2" role="button">
                    <a href="mailto:fake@fake.fake" class="btn btn-primary btn-block" style="text-align:left"><span class="glyphicon glyphicon-envelope"></span></a>
                </div>
                <div class="col-sm-6" style="margin-top:1em" tabindex="2" role="button">
                    <a href=<?php echo '"tel:'.htmlspecialchars(rawurldecode($_GET['PhoneNUMBER'])).'"'?> class="btn btn-primary btn-block" style="text-align:left"><span class="glyphicon glyphicon-earphone"></span> <?php echo htmlspecialchars(rawurldecode($_GET['PhoneNUMBER'])) ?></a>
                </div>
            </div>
        </div><!-- container end -->

                <script>
        <?php echo file_get_contents(__DIR__.'\\bootstrap.native-master\\dist\\bootstrap-native.min.js') ?>
        </script>
    </body>
</html>
