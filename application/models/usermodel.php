<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Usermodel extends CI_Model {

    function __construct()
    {
        parent::__construct();
        
        $this->load->database();
        $this->load->library('session');
        $this->load->library('ion_auth');
        
    }
    
    
    /*
    
    	returns all available users
    
    */
    
    public function getAll() {
    
    	$query = $this->db->from('users')->get();
    	
    	return $query->result();
    
    }
    
    
    
    /*
    	
    	returns all images belonging to user
    	
    */
    
    public function getUserImages( $userID ) {
    
    	if( is_dir( $this->config->item('images_uploadDir')."/".$userID ) ) {
    	
    		$folderContent = directory_map($this->config->item('images_uploadDir')."/".$userID, 2);
    		
    		//die( print_r($folderContent) );
    		
    		if( $folderContent ) {
    		
    			$userImages = array();
    		
    			foreach( $folderContent as $key => $item ) {
    		
    				if( !is_array($item) ) {
    			
    					//check the file extension
    				
    					$tmp = explode(".", $item);
    					
    					
    					//prep allowed extensions array
    				
    					$temp = explode("|", $this->config->item('images_allowedExtensions'));
    				
    					if( in_array($tmp[1], $temp) ) {
    				
    						array_push($userImages, $item);
    				
    					}
    							
    				}
    		
    			}
    		
    			return $userImages;
    		
    		} else {
    		
    			return false;
    		
    		}
    	
    	} else {
    	
    		return false;
    	
    	}
    
    }
    
    
    
    /*
    	
    	returns all users including their sites
    
    */
    
    public function getUsersPlusSites($userID = '') {
    
    	$return = array();
    	
    	//get the app users
    	
    	if( $userID == '' ) {
    	
    		$users = $this->ion_auth->users()->result();
    	
    	} else {
    	
    		$users = $this->ion_auth->user($userID)->result();
    	
    	}
    	    
    	foreach( $users as $user ) {
    	
    		$temp = array();
    		
    		$temp['userData'] = $user;
    		
    		if( $this->ion_auth->is_admin( $user->id ) ) {
    		
    			$temp['is_admin'] = 'yes';
    		
    		} else {
    		
    			$temp['is_admin'] = 'no';
    		
    		}
    		
    		
    		//get this user's sites
    		$temp['sites'] = $this->sitemodel->all( $user->id );
    		
    		
    		//push into the final array
    		$return[] = $temp;
    	
    	}
    	
    	//die( print_r($return) );
    	
    	return $return;
    
    }
    /*
    	
    	returns all users excepts admin for autocomplete
    
    */
    
    public function getUsersExceptsAdminForAutocomplete($term) {
    
    	$return = array();
        
    	//get all users excepts admin
        $this->db->select('users.id, users.first_name, users.last_name, users.email');
        $this->db->from('users');
        $this->db->join('users_groups', 'users_groups.user_id = users.id', 'inner');
        $this->db->like('users.email', $term);
        $this->db->where('users_groups.user_id NOT IN (SELECT users_groups.user_id FROM users_groups WHERE users_groups.`group_id` = 1)');

    	$users = $this->db->get()->result();
        
    	foreach( $users as $user ) {
            $first_name = htmlentities(stripslashes($user->first_name));
            $last_name = htmlentities(stripslashes($user->last_name));
            $email = htmlentities(stripslashes($user->email));
            $user_id = $user->id;
            $label = $first_name . ' ' . $last_name;
            
            $new_row['label'] = $label;
            $new_row['value'] = $user_id;
            $return[] = $new_row; //build an array
    	}
    	
    	//die( print_r($return) );
    	
    	return $return;
    
    }
    
}