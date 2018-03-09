<!DOCTYPE HTML>
<html>
<?php require 'php/includes/head.php' ?>

<!-- Create the PDO object -->
<?php
    $dsn = 'mysql:host=localhost; dbname=dropx103_resource_db';
    $userName = 'dropx103';
    $passWord = 'som3thingsom3thing';
	
    try {
        $db = new PDO($dsn, $userName, $passWord);
    } catch (PDOException $e) {
        $error_message = $e->getMessage();
        echo "<p>Connection failed: $error_message</p>";
    }
?>

<body id="mainPage">
<?php require 'php/includes/navbar.php' ?>

<!-- MAP: Map & Basic-Info-Model -->
<div class="container-fluid">
    <div class="row">
        <div class="col-xs-12 col-sm-9">
            <!-- ?php require 'php/includes/model-basic-info.php' ? -->
            <!-- ?php require 'php/includes/map.php' ? -->
       
            <?php            
                $resourceTypesQuery = "SELECT ResourceTypeName, ResourceTypeID FROM ResourceTypes";
                $resourceTypesStatement = $db->prepare($resourceTypesQuery);
                $resourceTypesStatement->execute();
                $resourceTypes = $resourceTypesStatement->fetchAll();
                $resourceTypesStatement->closeCursor();
            ?>
            <?php foreach /* thing in */ ($resourceTypes as $resourceType): ?>
                <h3><?php echo $resourceType['ResourceTypeName']; ?></h3>   
                <table>
                    <thead>
                        <tr>
                            <th>Resource Name</th>
                            <th>Phone Number</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                            $resourceQuery = 'SELECT ResourceName, PhoneNUMBER, ResourceTypeName
                                      FROM Resources INNER JOIN 
                                           (
                                               ResourceTypeAssignment INNER JOIN ResourceTypes ON ResourceTypeAssignment.ResourceTypeID = ResourceTypes.ResourceTypeID 
                                           ) 
                                           ON Resources.ResourceID = ResourceTypeAssignment.ResourceID 
                                           WHERE ResourceTypeAssignment.ResourceTypeID = :resourceTypeID';
                            $resourceStatement = $db->prepare($resourceQuery);
                            $resourceStatement->execute(array(':resourceTypeID' => $resourceType['ResourceTypeID']));
                            $resources = $resourceStatement->fetchAll();
                            $resourceStatement->closeCursor();
                        ?>
                        <?php foreach /* thing in */ ($resources as $resource): ?>             
                            <tr>
                                <td><?php echo $resource['ResourceName']; ?></td>
                                <td><?php echo $resource['PhoneNUMBER']; ?></td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            <?php endforeach; ?>
            <div class = "col-xs-12 col-sm-3" id = "resourceList">
            </div>
        </div>
    </div>
    <div class = "container-fluid">
        <div class = "row">
            <div class = "col-xs-12" id = "resourcesHere">
            </div>
        </div>
    </div>
</div>
<script>
    <?php echo file_get_contents("dist/my-com.js"); ?>
</script>
</body>
</html>