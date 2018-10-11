<?php defined('BASEPATH') OR exit('No direct script access allowed');?>
<div class="col-xs-12 col-sm-12 col-md-12">
	<div class="panel panel-default">
	  	<div class="panel-heading"><i class="fa fa-sign-out"></i> DIREKTORI PESERTA DIDIK</div>
	  	<div class="panel-body">
	  		<form class="form-inline" onsubmit="return false;">
			  <div class="form-group">
			  		<label for="academic_year_id">Tahun Pelajaran</label>
			  		<?=form_dropdown('academic_year_id', $ds_academic_years, NULL, 'class="form-control input-sm" id="academic_year_id"');?>
			  </div>
			  <div class="form-group">
			  		<label for="class_group_id">Kelas</label>
			  		<?=form_dropdown('class_group_id', $ds_class_groups, '', 'class="form-control input-sm" id="class_group_id"');?>
			  </div>
			  <button type="button" onclick="search_students()" class="btn btn-sm btn-primary"><i class="fa fa-search"></i> CARI</button>
			</form>
			<hr>
			<div class="table-responsive student-directory"></div>
	  	</div>
	</div>
</div>