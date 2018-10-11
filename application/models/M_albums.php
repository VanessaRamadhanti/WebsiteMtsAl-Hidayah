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

class M_albums extends CI_Model {

	/**
	 * Primary key
	 * @var String
	 */
	public static $pk = 'id';

	/**
	 * Table
	 * @var String
	 */
	public static $table = 'albums';

	/**
	 * Class constructor
	 * @return	Void
	 */
	public function __construct() {
		parent::__construct();
	}

	/**
	 * Get data for pagination
	 * @param String
	 * @param Int
	 * @param Int
	 * @return Query
	 */
	public function get_where($keyword = '', $limit = 0, $offset = 0) {
		$this->db->select('id, album_title, album_description, album_cover, album_slug, is_deleted');
		if (!empty($keyword)) {
			$this->db->like('album_title', $keyword);
			$this->db->or_like('album_description', $keyword);
			$this->db->or_like('album_slug', $keyword);
		}
		if ($limit > 0) {
			$this->db->limit($limit, $offset);
		}
		return $this->db->get(self::$table);
	}

	/**
	 * Get All Albums
	 * @return Query
	 */
	public function get_albums($limit = 0) {
		$this->db->select('id, album_title, album_description, album_cover, album_slug');
		$this->db->where('is_deleted', 'false');
		$this->db->order_by('created_at', 'DESC');
		if ($limit > 0) {
			$this->db->limit($limit);
		}
		return $this->db->get(self::$table);
	}

	/**
	 * Get Total row for pagination
	 * @param String
	 * @return Int
	 */
	public function total_rows($keyword = '') {
		if (!empty($keyword)) {
			$this->db->like('album_title', $keyword);
			$this->db->or_like('album_description', $keyword);
			$this->db->or_like('album_slug', $keyword);
		}
		return $this->db->count_all_results(self::$table);
	}

	/**
	 * more_photo
	 * @param Int
	 * @return query
	 */
	public function more_photo($offset) {
		$this->db->select('id, album_title, album_description, album_cover, album_slug');
		$this->db->where('is_deleted', 'false');
		$this->db->order_by('created_at', 'DESC');
		if ($offset > 0) {
			$this->db->limit(6, $offset);
		}
		return $this->db->get(self::$table);
	}
}
