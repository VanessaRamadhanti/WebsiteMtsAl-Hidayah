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

class Search extends Public_Controller {

	/**
	 * Constructor
	 * @access  public
	 */
	public function __construct() {
		parent::__construct();
		$this->load->helper(['text']);
		$this->load->model(['m_posts', 'm_pages']);
	}

	/**
	 * Index
	 * @access  public
	 */
	public function index() {
		if ($_POST) {
			$this->load->library('form_validation');
			$this->form_validation->set_rules('keyword', 'Kata Kunci Pencarian', 'trim|required|alpha_numeric_spaces|max_length[100]');
			$this->vars['posts'] = $this->vars['pages'] = FALSE;
			if ($this->form_validation->run() == FALSE) {
				$this->session->unset_userdata('keyword');
				$this->vars['title'] = 'Anda memasukan karakter yang tidak diizinkan oleh sistem kami!';
			} else {
				$keyword = trim(strip_tags($this->input->post('keyword', true)));
				$this->session->set_userdata('keyword', $keyword);
				$this->vars['title'] = 'Hasil pencarian dengan kata kunci "'.$this->session->userdata('keyword').'"';
				$this->vars['posts'] = $this->m_posts->search($keyword);
				$this->vars['pages'] = $this->m_pages->search($keyword);
			}
			$this->vars['content'] = 'themes/'.theme_folder().'/search-results';
			$this->load->view('themes/'.theme_folder().'/index', $this->vars);
		} else {
			redirect(base_url());
		}
	}
}