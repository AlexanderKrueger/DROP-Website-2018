<!DOCTYPE HTML>
<html>
<?php require 'php/includes/head.php' ?>
<?php require 'php/model/db.php' ?>

<!-- Create the PDO object -->
<?php
    $db = getAccess();
    $dsn = 'mysql:host=localhost;dbname=dropx103_resource_db';
    $userName = 'dropx103';
    $passWord = 'som3thingsom3thing';
	
    /*try {
        global $db = new PDO($dsn, $userName, $passWord);
    } catch (PDOException $e) {
        $error_message = $e->getMessage();
        echo "<p>Connection failed: $error_message</p>";
    }*/
?>
<?php            
    $resourceTypesQuery = "SELECT ResourceTypeName, ResourceTypeID FROM ResourceTypes";
    $resourceTypesStatement = $db->prepare($resourceTypesQuery);
    $resourceTypesStatement->execute();
    $resourceTypes = $resourceTypesStatement->fetchAll();
    $resourceTypesStatement->closeCursor();
?>

<body id="mainPage">
<?php require 'php/includes/navbar.php' ?>

<!-- Resource Tables -->
<div class="container-fluid">
    <div class="row">
    <div class="col-xs-12 col-lg-6">              
            <!--
            Resource type drop-down
            -->
            <div class="form-group">
            <label for="resource-type-selector">Filter By Resource Type</label>
            <select id="resource-type-selector" class="form-control" onchange="filterTables()">
                <option value="All">All</option>
            <?php foreach /* thing in */ ($resourceTypes as $resourceType): ?>
                <option value=<?php echo '"'.str_replace(' ', '-', $resourceType['ResourceTypeName']).'"'; ?>><?php echo $resourceType['ResourceTypeName']; ?></option>
            <?php endforeach; ?>
            </select>
            </div>
         </div>
    </div>
    <div class="row">
        <div class="col-xs-12 col-sm-9">
            <!-- ?php require 'php/includes/model-basic-info.php' ? -->
            <!-- ?php require 'php/includes/map.php' ? -->
       
       
            <div id="table-container" style="display:grid; grid: auto / auto auto; grid-column-gap: 1em;">

            <?php foreach /* thing in */ ($resourceTypes as $resourceType): ?>
            <div>
            <h3 id=<?php echo '"'.str_replace(' ', '-', $resourceType['ResourceTypeName']).'"'; ?>><?php echo $resourceType['ResourceTypeName']; ?></h3>   
                <table class="table table-striped">
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
                                           WHERE ResourceTypeAssignment.ResourceTypeID = :resourceTypeID ORDER BY Resources.ResourceName';
                            $resourceStatement = $db->prepare($resourceQuery);
                            $resourceStatement->execute(array(':resourceTypeID' => $resourceType['ResourceTypeID']));
                            $resources = $resourceStatement->fetchAll();
                            $resourceStatement->closeCursor();
                        ?>
                        <?php foreach /* thing in */ ($resources as $resource): ?>             
                            <tr style="cursor:pointer; -webkit-touch-callout: none; -webkit-user-select: none; -khtml-user-select: none; -moz-user-select: none; -ms-user-select: none; user-select: none;" onclick=<?php echo "\"window.location.assign('http://drop.x10host.com/resource.php?ResourceName=".rawurlencode($resource['ResourceName'])."')\""?>>
                                <td><?php echo $resource['ResourceName']; ?></td>
                                <td><?php echo $resource['PhoneNUMBER']; ?></td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
                </div>
            <?php endforeach; ?>
            </div>
            <div class = "col-xs-12 col-sm-3" id = "resourceList">
            </div>
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
<script>
    function filterTables(){
        var valueOfSelected = document.getElementById("resource-type-selector").value;
        var tableContainer = document.getElementById("table-container");
        
        if(   valueOfSelected == "All" 
           || valueOfSelected == "" 
           || valueOfSelected == null 
           || valueOfSelected == undefined)
        {
            //Show all tables
            for (var child of tableContainer.children)
            {
                child.style.display = "initial";
            }
        }
        else
        {
            for (var child of tableContainer.children)
            {
                if(child.querySelector("h3").id == null)
                {
                    console.error("ERROR: An h3 element is not used for resource table(s). Refer to function 'filterTables()'");
                    return;
                }
                
                if(child.querySelector("h3").id == valueOfSelected)
                {
                    child.style.display = "initial";
                }
                else
                {
                    child.style.display = "none";
                }
            }
            
            window.location.assign(window.location.origin + '/#' + valueOfSelected);
            
            //This line dis-allows scrolling (perceptionaly) when filtering resource types, but allows scrolling to the exact
            //table when the user is coming from a bookmark/internet short-cut (i.e. www.example.com/#element)
            window.scrollTo(0, document.getElementById("resource-type-selector").scrollTop);
        }
    }
</script>
</body>
</html>