<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * CMS Sekolahku | CMS (Content Management System) dan PPDB/PMB Online GRATIS 
 * untuk sekolah SD/Sederajat, SMP/Sederajat, SMA/Sederajat, dan Perguruan Tinggi
 * @version    2.2.0
 * @author     Anton Sofyan | https://facebook.com/antonsofyan | 4ntonsofyan@gmail.com | 0857 5988 8922
 * @copyright  (c) 2014-2017
 * @link       http://sekolahku.web.id
 * @since      Version 2.2.0
 *
 * PERINGATAN :
 * 1. TIDAK DIPERKENANKAN MEMPERJUALBELIKAN APLIKASI INI TANPA SEIZIN DARI PIHAK PENGEMBANG APLIKASI.
 * 2. TIDAK DIPERKENANKAN MENGHAPUS KODE SUMBER APLIKASI.
 * 3. TIDAK MENYERTAKAN LINK KOMERSIL (JASA LAYANAN HOSTING DAN DOMAIN) YANG MENGUNTUNGKAN SEPIHAK.
 */

class Import extends Admin_Controller {

	/**
	 * Class constructor
	 * @return	Void
	 */
	public function __construct() {
		parent::__construct();
		$this->load->model('m_employees');
	}

	/**
	 * Index
	 * @return	Void
	 */
	public function index() {
		$this->vars['title'] = 'IMPORT GURU DAN TENAGA KEPENDIDIKAN';
		$this->vars['employees'] = $this->vars['import_employees'] = true;
		$this->vars['content'] = 'employees/import';
		$this->load->view('backend/index', $this->vars);
	}

	/**
	 * Save
	 * @return 	Json 
	 */
	public function save() {
		$rows	= explode("\n", $this->input->post('employees'));
		$success = 0;
		$failed = 0;
		$exist = 0;
		foreach($rows as $row) {
			$exp = explode("\t", $row);
			if (count($exp) != 6) continue;
			$fill_data = [];
			$fill_data['nik'] = trim($exp[0]);
			$fill_data['full_name'] = trim($exp[1]);
			$fill_data['gender'] = trim($exp[2]) == 'L' ? 'M' : 'F';
			$fill_data['street_address'] = trim($exp[3]);
			$fill_data['birth_place'] = trim($exp[4]);
			$fill_data['birth_date'] = trim($exp[5]);
			$fill_data['email'] = trim($exp[0]).'@'.str_replace(['http://www.', 'https://www.', 'http://', 'https://'], '', rtrim($this->session->userdata('website'), '/'));
			$query = $this->model->isValExist('nik', trim($exp[0]), 'employees');
			if (!$query) {
				$this->model->insert('employees', $fill_data) ? $success++ : $failed++;
			} else {
				$exist++;
			}
		}
		$response = [];
		$response['type'] = 'info';
		$response['message'] = 'Success : ' . $success. ' rows, Failed : '. $failed .', Exist : ' . $exist;
		$this->output
			->set_content_type('application/json', 'utf-8')
			->set_output(json_encode($response, JSON_PRETTY_PRINT))
			->_display();
		exit;
	}
}