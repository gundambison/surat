<?php 
if(isset($cari)){
	$sql="SELECT 
	s.*, kpd_yth, isi_disposisi, sifat, batas_waktu, catatan  
	FROM t_surat_masuk s left join t_disposisi d 
			on d.id_surat=s.id
	WHERE isi_ringkas LIKE '%$cari%' OR indek_berkas LIKE '%$cari%' OR dari LIKE '%$cari%' OR no_surat LIKE '%$cari%' OR kode LIKE '%$cari%' OR no_agenda LIKE '%$cari%' OR tgl_surat LIKE '%$cari%' ORDER BY id DESC";
	$data=$this->db->query($sql)->result();
}
else{ 
	$sql="SELECT 
s.*, kpd_yth, isi_disposisi, sifat, batas_waktu, catatan  
FROM t_surat_masuk s left join t_disposisi d 
			on d.id_surat=s.id
			WHERE 
			YEAR(tgl_diterima) = '$ta' 
	LIMIT $awal, $akhir ";
	$data=$this->db->query($sql)->result();
} 

?><div class="clearfix">
<div class="row">
  <div class="col-lg-12">
	
	<div class="navbar navbar-inverse">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">Surat Masuk</a>
			</div>
		<div class="navbar-collapse collapse navbar-inverse-collapse" style="margin-right: -20px">
			<ul class="nav navbar-nav">
				<li><a href="<?php echo base_URL(); ?>index.php/admin/surat_masuk/add" class="btn-info"><i class="icon-plus-sign icon-white"> </i> Tambah Data</a></li>
			</ul>
			
			<ul class="nav navbar-nav navbar-right">
				<form class="navbar-form navbar-left" method="post" action="<?php echo base_URL(); ?>index.php/admin/surat_masuk/cari">
					<input type="text" class="form-control" name="q" style="width: 200px" placeholder="Kata kunci pencarian ..." required>
					<button type="submit" class="btn btn-danger"><i class="icon-search icon-white"> </i> Cari</button>
				</form>
			</ul>
		</div><!-- /.nav-collapse -->
		</div><!-- /.container -->
	</div><!-- /.navbar -->

  </div>
</div>

<?php echo $this->session->flashdata("k");?>
	
<!--	
<div class="alert alert-dismissable alert-success">
  <button type="button" class="close" data-dismiss="alert">x</button>
  <strong>Well done!</strong> You successfully read <a href="http://bootswatch.com/amelia/#" class="alert-link">this important alert message</a>.
</div>
	
<div class="alert alert-dismissable alert-danger">
  <button type="button" class="close" data-dismiss="alert">x</button>
  <strong>Oh snap!</strong> <a href="http://bootswatch.com/amelia/#" class="alert-link">Change a few things up</a> and try submitting again.
</div>	
-->

<table class="table table-bordered table-hover">
	<thead>
		<tr>
			<th width="5%">No. Agenda</th>
			<th width="15%">Nomor, Tgl. Surat</th>
			<th width="20%">Perihal</th>
			<th width="10%">Asal Surat</th>
			<th width="10%">Tujuan Disposisi</th>
			<th width="15%">Aksi</th>
			
		</tr>
	</thead>
	
	<tbody>
		<?php 
		if (empty($data)) {
			echo "<tr><td colspan='5'  style='text-align: center; font-weight: bold'>--Data tidak ditemukan--</td></tr>";
		} else {
			$no 	= ($this->uri->segment(4) + 1);
			foreach ($data as $b) {  
		?>
		<tr>
			<td><?php echo $b->no_agenda;?></td>
			<td><?php echo $b->no_surat."<br><i>".tgl_jam_sql($b->tgl_surat)."</i>"?></td>
			<td><?php echo $b->isi_ringkas?></td>
			<td><?php echo $b->dari; ?></td>
             <td><?php echo $b->kpd_yth; ?></td>
			
			<td class="ctr">
				<?php  
				if ($b->pengolah == $this->session->userdata('admin_id')) {
				?>
				<div class="btn-group">
					<a href="<?php echo base_URL()?>index.php/admin/surat_masuk/edt/<?php echo $b->id?>" class="btn btn-success btn-sm" title="Edit Data"><i class="icon-edit icon-white"> </i> Edt</a>
					<a href="<?php echo base_URL()?>index.php/admin/surat_masuk/del/<?php echo $b->id?>" class="btn btn-warning btn-sm" title="Hapus Data" onclick="return confirm('Anda Yakin..?')"><i class="icon-trash icon-remove">  </i> Hapus</a>			
					<a href="<?php echo base_URL()?>index.php/admin/surat_disposisi/<?php echo $b->id?>" class="btn btn-default btn-sm"  title="Disposisi Surat"><i class="icon-trash icon-list"> </i> Disp</a>
					<a href="<?php echo base_URL()?>index.php/admin/disposisi_cetak/<?php echo $b->id?>" class="btn btn-info btn-sm" target="_blank" title="Cetak Disposisi"><i class="icon-print icon-white"> </i> Ctk</a>

					<a target='_blank' href="<?php echo base_URL()?>upload/surat_masuk/<?php echo $b->file?>" class="btn btn-success btn-sm" title="Edit Data"><i class="icon-edit icon-white"> </i> Buka</a>
				</div>	
				<?php 
				} else {
				?>
				<div class="btn-group">
					<!--a href="<?php echo base_URL()?>index.php/admin/surat_masuk/edt/<?php echo $b->id?>" class="btn btn-success btn-sm" title="Edit Data"><i class="icon-edit icon-white"> </i> Edt</a>
					<a href="<?php echo base_URL()?>index.php/admin/surat_masuk/del/<?php echo $b->id?>" class="btn btn-warning btn-sm" title="Hapus Data" onclick="return confirm('Anda Yakin..?')"><i class="icon-trash icon-remove">  </i> Del<!/a-->			
					<a href="<?php echo base_URL()?>index.php/admin/surat_disposisi/<?php echo $b->id?>" class="btn btn-default btn-sm"  title="Disposisi Surat"><i class="icon-trash icon-list"> </i> Disp</a>
					<a href="<?php echo base_URL()?>index.php/admin/disposisi_cetak/<?php echo $b->id?>" class="btn btn-info btn-sm" target="_blank" title="Cetak Disposisi"><i class="icon-print icon-white"> </i> Ctk</a>
					<a target='_blank' href="<?php echo base_URL()?>upload/surat_masuk/<?php echo $b->file?>" class="btn btn-success btn-sm" title="Edit Data"><i class="icon-edit icon-white"> </i> Buka</a>
				</div>	
				<?php 
				}
				?>
				
			</td>
		</tr>
		<?php 
			$no++;
			}
		}
		?>
	</tbody>
</table>
<center><ul class="pagination"><?php echo $pagi; ?></ul></center>
</div>
