 <?php require'../includes/admin-head.php'; ?>
    <input type="hidden" id="curPage" value="adminHome">
    <div class="row">
        <div class="col-lg-3 col-xs-3" id="ResourceList">
            <form action="admin.php" method="post">
                <ul class="list-group"> <?php
                    
					//require'../includes/admin-head.php' ON LINE 1 INCLUDES require 'admin_php_querys.php' WHICH CONTAINS include('../model/db.php')
					//TO PREVENT AN ERROR THE LINE BELOW HAS BEEN COMMENTED OUT
					//require'../model/db.php';
                    $resTypes = getAll('ResourceTypes');

                    foreach ($resTypes as $curType) {
                        echo "<li class=\"list-group-item\"><button class='btn btn-info' name='curResType' value='{$curType['ResourceTypeName']}'>{$curType['ResourceTypeName']}</button></li>";
                    }
                ?></ul>
            </form>
        </div>
        <div class="col-lg-9 col-xs-9">
            <?php
                if(isset($_POST['curResType']) == true) {
                    require '../includes/resTypes.php';
                }
            ?>
        </div>
    </div>
 <?php require'../includes/admin-footer.php'; ?>