<?php defined('BASEPATH') OR exit('No direct script access allowed');?>
<div class="col-xs-12 col-md-9">
	<ol class="breadcrumb post-header">
		<li><?=$title?></li>
	</ol>
	<?php if($posts || $pages) { ?>
	<div class="thumbnail no-border">
		<div class="caption">
			<?php if($posts) { ?>
				<?php if ($posts->num_rows() > 0) { ?>
					<h3>Tulisan</h3>
					<?php foreach($posts->result() as $row) { ?>
						<h4><a href="<?=site_url('read/'.$row->id.'/'.$row->post_slug)?>"><?=$row->post_title?></a></h4>
						<p style="text-align: justify;"><?=word_limiter(strip_tags($row->post_content), 30)?></p>
					<?php } ?>
				<?php } ?>
			<?php } ?>
			
			<?php if($pages) { ?>
				<?php if ($pages && $pages->num_rows() > 0) { ?>
					<hr>
					<h3>Halaman</h3>
					<?php foreach($pages->result() as $row) { ?>
						<h4><a href="<?=site_url('read/'.$row->id.'/'.$row->post_slug)?>"><?=$row->post_title?></a></h4>
						<p style="text-align: justify;"><?=word_limiter(strip_tags($row->post_content), 30)?></p>
					<?php } ?>
				<?php } ?>
			<?php } ?>
			<?php if ($pages && $pages->num_rows() == 0 && $posts && $posts->num_rows() == 0) { ?>
				<p>Hasil pencarian tidak ditemukan.</p>
			<?php } ?>	
		</div>
	</div>
	<?php } ?>
</div>
<?php $this->load->view('themes/journal/sidebar')?>