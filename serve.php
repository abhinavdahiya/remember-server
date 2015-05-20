<?php
    /**
     * Input : 
     * {
     *  "task":"SERVE"
     *  "user_id":"",
     *  "room_id":""
     * }
     *
     */
if(isset($_GET['data']) && !empty($_GET['data'])){
    $checkVar = true;
    include 'config/config.php';
    include 'libs/db.php';

    dbase::start_connection();

    $json = json_decode($_GET['data'],true);

    if($json['task'] == 'SERVE'){

        $query = mysql_query("SELECT `timestamp`, `prefrences`.`equip_id`,`equip_state`, `type`, `priority`,`pins`,`active_user` FROM `prefrences` 
                                INNER JOIN `equip` ON `equip`.`id` = `prefrences`.`equip_id`
                                INNER JOIN `room_equip` ON `prefrences`.`equip_id` = `room_equip`.`equip_id`

                                WHERE `user_id` = '$json[user_id]' AND `room_id` = $json[room_id]
                                ORDER BY prefrences.equip_id ASC");
        if(!$query) exit(mysql_error());

        $equip = array();
        while ($row = mysql_fetch_array($query)) {
            $temp['type'] = $row['type'];
            $temp['equip_id'] = $row['equip_id'];
            $temp['state'] = $row['equip_state'];
            $temp['priority'] = $row['priority'];
            $temp['timestamp'] = $row['timestamp'];
            $temp['active_user'] = $row['active_user'];
            $equip[] = $temp;
        }
        
        $mask = [0,0,0,0];
        $l=0;
        $change = 0;
        foreach ($equip as $value) {
            $query = mysql_query("SELECT priority FROM prefrences WHERE user_id = '$value[active_user]' AND equip_id = '$value[equip_id]'");
            if(!$query)exit(mysql_error());

            $priorityTest = 10;
            if(mysql_num_rows($query) > 0){
                $row = mysql_fetch_array($query);
                $priorityTest = $row['priority'];
            }

            if($value['priority'] <= $priorityTest || ($value['timestamp'] - time()) > 100) {
                $change = 1;
                if($value['state'] == 'ON') $mask[$l] = 1;

                $query = mysql_query("UPDATE prefrences SET active_user = $json[user_id], timestamp = '".time()."' WHERE equip_id = $value[equip_id]");
            }
            $l++;
            

        }

        if($change) {
            echo "http://192.168.0.2:10110/?data=".bindec(join("", $mask));
            file_get_contents("http://192.168.0.2:10110/?data=".bindec(join("", $mask)));
        }

    }


}


?>
