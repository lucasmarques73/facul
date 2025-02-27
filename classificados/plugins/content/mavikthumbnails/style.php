<?php header('Content-Type: text/css'); ?>
@CHARSET "UTF-8";

/* Zoomin image at thumbnails */
a.with-zoomin-img {
	position: relative;
	display: inline-block;
}

.zoomin-img {
	display: block;
	width: 24px;
	height: 24px;
	position: absolute;
	bottom: 3px;
	right: 3px;
	background-image: url(images/zoomin.gif);
	background-position: right bottom;
	background-repeat: no-repeat;
}

/* Zoomin cursor at thumbnails */
a.zoomin-cur {
	cursor: url(<?php echo $_GET['base']; ?>plugins/content/mavikthumbnails/images/zoomin.cur), pointer;
}
