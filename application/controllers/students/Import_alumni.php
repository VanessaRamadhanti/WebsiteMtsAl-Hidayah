<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Premium CMS Sekolahku
 * @version    1.1.0
 * @author     Anton Sofyan | https://facebook.com/antonsofyan | 4ntonsofyan@gmail.com | 0857 5988 8922
 * @copyright  (c) 2017
 * @link       http://sekolahku.web.id
 * @since      Version 1.1.0
 *
 * PERINGATAN :
 * 1. TIDAK DIPERKENANKAN MENGGUNAKAN CMS INI TANPA SEIZIN DARI PENGEMBANG.
 * 2. TIDAK DIPERKENANKAN MEMPERJUALBELIKAN APLIKASI INI TANPA SEIZIN DARI PIHAK PENGEMBANG APLIKASI.
 * 3. TIDAK DIPERKENANKAN MENGHAPUS KODE SUMBER APLIKASI.
 */

class Import_alumni extends Admin_Controller {

	/**
	 * Class constructor
	 * @return	Void
	 */
	public function __construct() {
		parent::__construct();
		$this->load->model('m_options');
	}

	/**
	 * Index
	 * @return	Void
	 */
	public function index() {
		$this->vars['title'] = 'IMPORT ALUMNI';
		$this->vars['students'] = $this->vars['import_alumni'] = true;
		$this->vars['content'] = 'students/import_alumni';
		$this->load->view('backend/index', $this->vars);
	}

	/**
	 * Save
	 * @return 	Json 
	 */
	public function save() {
		$rows	= explode("\n", $this->input->post('students'));
		$success = 0;
		$failed = 0;
		$exist = 0;
		foreach($rows as $row) {
			$exp = explode("\t", $row);
			if (count($exp) != 8) continue;
			$key = 'nis';
			if (get_school_level() == 5) {
				$key = 'nim';
			}
			$fill_data = [];
			$fill_data[$key] = trim($exp[0]);
			$fill_data['full_name'] = trim($exp[1]);
			$fill_data['gender'] = trim($exp[2]) == 'L' ? 'M' : 'F';
			$fill_data['start_date'] = trim($exp[3]);
			$fill_data['end_date'] = trim($exp[4]);
			$fill_data['mobile_phone'] = trim($exp[5]);
			$fill_data['email'] = trim($exp[6]);
			$fill_data['street_address'] = trim($exp[7]);
			$fill_data['is_transfer'] = 'false';
			$fill_data['is_prospective_student'] = 'false';
			$fill_data['is_alumni'] = 'true';
			$fill_data['is_student'] = 'false';
			$fill_data['citizenship'] = 'WNI';
			$fill_data['student_status'] = $this->m_options->get_options_id('student_status', 'lulus');
			$key_exist = $this->model->isValExist($key, trim($exp[0]), 'students');
			$email_exist = $this->model->isValExist($key, trim($exp[6]), 'students');
			if (!$key_exist && !$email_exist) {
				$this->model->insert('students', $fill_data) ? $success++ : $failed++;
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