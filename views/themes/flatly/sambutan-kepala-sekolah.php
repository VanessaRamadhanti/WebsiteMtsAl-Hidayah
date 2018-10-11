<?php defined('BASEPATH') OR exit('No direct script access allowed');?>
<div class="col-xs-12 col-md-9">
	<div class="thumbnail no-border">
		<div class="caption">
			<h3>Sambutan <?=(get_school_level() == 5 ? 'Rektor' : (get_school_level() == 6 ? 'Ketua': (get_school_level() == 7 ? 'Direktur' : 'Kepala Sekolah')));?></h3>
			<?=get_welcome()?>
			<div id="share1"></div>
			<script>
			$("#share1").jsSocials({
				shares: ["email", "twitter", "facebook", "googleplus", "linkedin", "pinterest", "stumbleupon", "whatsapp"]
			});
			</script>
		</div>
	</div>
</div>
<?php $this->load->view('themes/flatly/sidebar')?>
