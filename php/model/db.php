<?php
/**
 * Created by PhpStorm.
 * User: correywinke
 * Date: 4/3/17
 * Time: 11:31 PM
 */
    /*Summary:
     * Name of database accessable by any script once this script is loaded.
     */
    const DB_NAME = 'dropx103_resource_db';
    const DB_USERNAME = 'dropx103';
    const DB_PASSWORD = 'som3thingsom3thing';

    /*Summary:
     *Returns a PDO object that has access to the database.
     */
    function getAccess() {
        // by Correy Winke
        // 10/27/16
        // opens up a database
        $dsn = 'mysql:host=localhost;dbname='.DB_NAME;
        // check to see if it works
        try {
            $db = new PDO($dsn, DB_USERNAME, DB_PASSWORD);
            $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            return $db;
        } catch (PDOException $err) {
            exit($err->getMessage());
        }
    }
    /*Summary:
     *Takes the required parts to query a database through a PDO object
     *and inserts those things into working code.
     */
    /*Remarks:
     *Function provides some error feedback.
     */
    /*Parameters:
     * ($strQuer) - The MySQL query as a string (i.e. SELECT * FROM someTable WHERE someTable = :someValue)
     * ($aryStatments) - Array of each thing in the MySQL query that looks like this (element example: ":someSQLVariablePlaceholder")
     * ($aryValues) - Array of each value assigned to each element in '$aryStatments' (element example: 1, "a string", true)
     * ($intGetValues) - Value determining if a single or all rows of fetched data is returned.
     *                      If value = 0, then only a single row is returned
     *                      If value = 1, then all rows are returned
     */
    function handleSQL($strQuer="",$aryStatments=[], $aryValues=[], $intGetValues = 0) {
        $db = getAccess();
        if (count($aryStatments) == count($aryValues)) {
            $statement = $db->prepare($strQuer);
            if (!$statement) {
                exit("Sorry prepare failed");
            }
            for($lcv = 0;$lcv < count($aryStatments);$lcv++){
                $bind_results = $statement->bindValue($aryStatments[$lcv], $aryValues[$lcv]);
                if(!$bind_results) {
                    exit("Sorry can't bind these value");
                }
            }
            $workQuery = $statement->execute();
            if(!$workQuery) {
                exit("Bad execcution");
            }
            if ($intGetValues == 0){
                $newFeedback = $statement -> fetch();
            } elseif ($intGetValues == 1) {
                $newFeedback = $statement -> fetchAll();
            } else {
                $newFeedback = "";
            }
            $statement->closeCursor();
            return $newFeedback;
        } else {
            exit("Mismatched values");
        }
    }
	
	//returns the entirety of a table
	function getAll($table="") {
		$db = getAccess();
		$query = "SELECT * FROM " .$table;
		$statement = $db->prepare($query);
		if(!$statement) {
			exit("Sorry prepare failed");
		}
		$workQuery = $statement->execute();
		if(!$workQuery) {
			exit("Bad execution");
		}
		$newFeedback = $statement->fetchAll();
		$statement->closeCursor();
		return $newFeedback;
	}
?>