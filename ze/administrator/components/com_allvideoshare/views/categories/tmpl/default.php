<?php

/*
 * @version		$Id: default.php 1.2.1 2012-05-03 $
 * @package		Joomla
 * @copyright   Copyright (C) 2012-2013 MrVinoth
 * @license     GNU/GPL http://www.gnu.org/licenses/gpl-2.0.html
*/

defined('_JEXEC') or die('Restricted access');

$data = $this->data;

?>

<div id="avs">
  <form action="index.php" method="post" name="adminForm" id="adminForm" enctype="multipart/form-data">
    <table style="padding-bottom:10px;">
      <tr>
        <td align="left" width="100%"><strong><?php echo JText::_('FILTER'); ?> : </strong>
          <input type="text" name="search" id="search" value="<?php echo $this->lists['search'] ?>" class="text_area" title="<?php echo JText::_('FILTER_BY_NAME'); ?>"/>
          <button onclick="this.form.submit();">
		  	<?php echo JText::_('GO'); ?>
          </button>
          <button onclick="document.getElementById('search').value='';this.form.getElementById('filter_state').value='-1';this.form.submit();">
		  	<?php echo JText::_('RESET'); ?>
          </button>
        </td>
        <td nowrap="nowrap"><?php echo $this->lists['state']; ?></td>
      </tr>
    </table>
    <table class="adminlist">
      <thead>
        <tr>
          <th width="5%">#</th>
          <th width="5%"><input type="checkbox" name="toggle"  value="" onClick="checkAll(<?php echo count( $data ); ?>);" /></th>
          <th width="30%"><?php echo JText::_('CATEGORY_NAME'); ?></th>
          <th><?php echo JText::_('THUMB_IMAGE'); ?></th>
          <th width="8%"><?php echo JText::_('CATEGORY_ID'); ?></th>
          <th width="8%"><?php echo JText::_('PUBLISHED'); ?></th>
        </tr>
      </thead>
      <tbody>
        <?php
		$k = 0;
		for ($i=0, $n=count($data); $i < $n; $i++) {
			$row = $data[$i];

			$k         = $i % 2;
			$link 	   = JRoute::_( 'index.php?option=com_allvideoshare&view=categories&task=edit&'. JUtility::getToken() .'=1&'.'cid[]='. $row->id );
			$checked   = JHTML::_('grid.id', $i, $row->id );
			$published = JHTML::_('grid.published', $row, $i );
		?>
        <tr class="<?php echo "row$k"; ?>">
          <td align="center"><?php echo $i+1;?> </td>
          <td align="center"><?php echo $checked; ?> </td>
          <td align="center"><a href="<?php echo $link; ?>"> <?php echo $row->name;?> </a></td>
          <td align="center"><?php echo $row->thumb;?> </td>
          <td align="center"><?php echo $row->id;?> </td>
          <td align="center"><?php echo $published; ?> </td>
        </tr>
        <?php } ?>
      </tbody>
      <tfoot>
        <tr>
          <td colspan="15"><?php echo $this->pagination->getListFooter(); ?></td>
        </tr>
      </tfoot>
    </table>
    <input type="hidden" name="boxchecked" value="0">
    <input type="hidden" name="option" value="com_allvideoshare" />
    <input type="hidden" name="view" value="categories" />
    <input type="hidden" name="task" value="" />
    <?php echo JHTML::_( 'form.token' ); ?>
  </form>
</div>