<?php

/*
 * @version		$Id: categories.php 1.2.1 2012-05-03 $
 * @package		Joomla
 * @copyright   Copyright (C) 2012-2013 MrVinoth
 * @license     GNU/GPL http://www.gnu.org/licenses/gpl-2.0.html
*/

// no direct access
defined('_JEXEC') or die('Restricted access');

// Import Joomla! libraries
jimport('joomla.application.component.model');

// Import filesystem libraries.
jimport('joomla.filesystem.file');

class AllVideoShareModelCategories extends JModel {

    function __construct() {
		parent::__construct();
    }
	
	function getdata()
    {
		 $mainframe        = JFactory::getApplication();	
		 $option           = JRequest::getCmd('option');
		 $view             = JRequest::getCmd('view');
		 
		 $limit            = $mainframe->getUserStateFromRequest('global.list.limit', 'limit', $mainframe->getCfg('list_limit'), 'int');
		 $limitstart       = $mainframe->getUserStateFromRequest($option.$view.'.limitstart', 'limitstart', 0, 'int');
		 $filter_state     = $mainframe->getUserStateFromRequest($option.$view.'filter_state', 'filter_state', -1, 'int');
		 $search           = $mainframe->getUserStateFromRequest($option.$view.'search', 'search', '', 'string');
		 $search           = JString::strtolower($search);
		 
	     $db               = &JFactory::getDBO();
         $query            = "SELECT * FROM #__allvideoshare_categories";
		 $where            = array();
		 
		 if ($filter_state > -1) {
			$where[]       = "published={$filter_state}";
		 }
		
		 if ( $search ) {
			$where[]       = 'LOWER(name) LIKE '.$db->Quote( '%'.$db->getEscaped( $search, true ).'%', false );
		 }

		 $where 		   = ( count( $where ) ? ' WHERE '. implode( ' AND ', $where ) : '' );
		 
		 $query           .= $where;
         $db->setQuery( $query, $limitstart, $limit );
         $output = $db->loadObjectList();
		 
         return($output);
	}
	
	function gettotal()
    {
		 $mainframe        = JFactory::getApplication();	
		 $option           = JRequest::getCmd('option');
		 $view             = JRequest::getCmd('view');
		 
		 $filter_state     = $mainframe->getUserStateFromRequest($option.$view.'filter_state', 'filter_state', -1, 'int');
		 $search           = $mainframe->getUserStateFromRequest($option.$view.'search', 'search', '', 'string');
		 $search           = JString::strtolower($search);
		 
         $db               =& JFactory::getDBO();
         $query            = "SELECT COUNT(*) FROM #__allvideoshare_categories";
		 $where            = array();
		 
		 if ($filter_state > -1) {
			$where[]       = "published={$filter_state}";
		 }

		 if ( $search ) {
			$where[]       = 'LOWER(name) LIKE '.$db->Quote( '%'.$db->getEscaped( $search, true ).'%', false );
		 }

		 $where 		   = ( count( $where ) ? ' WHERE '. implode( ' AND ', $where ) : '' );
		 
		 $query           .= $where;

         $db->setQuery( $query );
         $output = $db->loadResult();
         return($output);
	}
	
	function getpagination()
    {
		 $mainframe  = JFactory::getApplication();	
		 $option     = JRequest::getCmd('option');
		 $view       = JRequest::getCmd('view');
		 
		 $total      = $this->gettotal();
		 $limit      = $mainframe->getUserStateFromRequest('global.list.limit', 'limit', $mainframe->getCfg('list_limit'), 'int');
		 $limitstart = $mainframe->getUserStateFromRequest($option.$view.'.limitstart', 'limitstart', 0, 'int');
     
    	 jimport( 'joomla.html.pagination' );
		 $pageNav    = new JPagination($total, $limitstart, $limit);
         return($pageNav);
	}
	
	function getlists()
    {
		 $mainframe              = JFactory::getApplication();	
		 $option                 = JRequest::getCmd('option');
		 $view                   = JRequest::getCmd('view');
		 
		 $filter_state           = $mainframe->getUserStateFromRequest($option.$view.'filter_state','filter_state',-1,'int' );
		 $search                 = $mainframe->getUserStateFromRequest($option.$view.'search','search','','string');
		 $search                 = JString::strtolower ( $search );
     
    	 $lists                  = array ();
		 $lists ['search']       = $search;
            
		 $filter_state_options[] = JHTML::_('select.option', -1, JText::_('SELECT_PUBLISHING_STATE'));
		 $filter_state_options[] = JHTML::_('select.option', 1, JText::_('PUBLISHED'));
		 $filter_state_options[] = JHTML::_('select.option', 0, JText::_('UNPUBLISHED'));
		 $lists['state']         = JHTML::_('select.genericlist', $filter_state_options, 'filter_state', 'onchange="this.form.submit();"', 'value', 'text', $filter_state);
		 
         return($lists);
	}
	
	function getrow()
    {
     	 $db  =& JFactory::getDBO();
         $row =& JTable::getInstance('allvideosharecategories', 'Table');
         $cid =  JRequest::getVar( 'cid', array(0), '', 'array' );
         $id  =  $cid[0];
         $row->load($id);

         return $row;
	}
	
	function save()
	{
		 $mainframe = JFactory::getApplication();
	  	 $row       = &JTable::getInstance('allvideosharecategories', 'Table');
	  	 $cid       = JRequest::getVar( 'cid', array(0), '', 'array' );
      	 $id        = $cid[0];
      	 $row->load($id);
	
      	 if(!$row->bind(JRequest::get('post')))
	  	 {
		 	JError::raiseError(500, $row->getError() );
	  	 }
	  
	   	 jimport( 'joomla.filter.output' );
	  	 $row->name = JString::trim($row->name);
	  	 if(!$row->slug) $row->slug = $row->name;
		 $row->slug = JFilterOutput::stringURLSafe($row->slug);
	  
	  	 if($row->type == 'upload')
	  	 {
	     	jimport('joomla.filesystem.file');
		
			$dir = JFilterOutput::stringURLSafe( $row->name );	
		 	if(!JFolder::exists(ALLVIDEOSHARE_UPLOAD_BASE . $dir . DS)) {
				JFolder::create(ALLVIDEOSHARE_UPLOAD_BASE . $dir . DS);
			}
		
	  		$row->thumb = $this->upload('upload_thumb', $dir);
	  	 }
	  
	  	 if(!$row->store()){
			JError::raiseError(500, $row->getError() );
	  	 }

	  	 switch (JRequest::getCmd('task'))
      	 {
        	case 'apply':
            	$msg  = JText::_('CHANGES_SAVED');
             	$link = 'index.php?option=com_allvideoshare&view=categories&task=edit&'. JUtility::getToken() .'=1&'.'cid[]='.$row->id;
             	break;
        	case 'save':
        	default:
              	$msg  = JText::_('SAVED');
              	$link = 'index.php?option=com_allvideoshare&view=categories';
              	break;
      	 }
	  
	  	 $mainframe->redirect($link, $msg);
	}
	
	function upload($filename, $dir)
	{
	 	 $temp = $_FILES[$filename]['tmp_name'];
	  	 $file = JFile::makeSafe($_FILES[$filename]['name']);	 
	  
      	 if($file != "") {
     	 	if(JFile::upload($temp, ALLVIDEOSHARE_UPLOAD_BASE . $dir . DS . $file)) {
		 		return ALLVIDEOSHARE_UPLOAD_BASEURL . $dir . '/' . $file;
		 	} else {
		 		JError::raiseWarning(21, JText::_('ERROR_OCCURED_WHILE_UPLOADING'));
				return false;
		 	}
	  	 }		
	}
	
	function cancel()
	{
		 $mainframe = JFactory::getApplication();
		 
		 $link = 'index.php?option=com_allvideoshare&view=categories';
	     $mainframe->redirect($link);
	}	

	function delete()
	{
		$mainframe = JFactory::getApplication();
        $cid       = JRequest::getVar( 'cid', array(), '', 'array' );
        $db        =& JFactory::getDBO();
        $cids       = implode( ',', $cid );
        if(count($cid))
        {
            $query = "DELETE FROM #__allvideoshare_categories WHERE id IN ( $cids )";
            $db->setQuery( $query );
            if (!$db->query())
            {
                echo "<script> alert('".$db->getErrorMsg()."');window.history.go(-1); </script>\n";
            }
        }
		
        $mainframe->redirect( 'index.php?option=com_allvideoshare&view=categories' );
	}
	
	function publish()
    {
		$mainframe = JFactory::getApplication();
		$cid       = JRequest::getVar( 'cid', array(), '', 'array' );
        $publish   = ( JRequest::getCmd('task') == 'publish' ) ? 1 : 0;
			
        $reviewTable =& JTable::getInstance('allvideosharecategories', 'Table');
        $reviewTable->publish($cid, $publish);
        $mainframe->redirect( 'index.php?option=com_allvideoshare&view=categories' );
    }
	
}

?>