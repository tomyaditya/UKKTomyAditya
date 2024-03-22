<?php
session_start();
$userid = $_SESSION['userid'];
include'../config/koneksi.php';
if ($_SESSION['status'] != 'login') {
  echo "<script>
  alert('Anda belum login!');
  location.href='../index.php';
  </script>";
}

?>


<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title> Photo Gallery </title>
  <link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>
</head>
<body> 

  <nav class="navbar navbar-expand-lg bg-warning-subtle">
    <div class="container">
	<img src="Untitled507_20240319140438.png" alt="Logo" width="50">
      <a class="navbar-brand" href="index.php"> Photo Gallery </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse mt-2" id="navbarNavAltMarkup">
        <div class="navbar-nav me-auto">
          <a href="home.php" class="nav-link"> Home </a>
          <a href="album.php" class="nav-link"> Album </a>
          <a href="foto.php" class="nav-link"> Photo </a>    
        </div>
        
        <a href="../config/aksi_logout.php" class="btn btn-outline-danger m-1"> Keluar </a>
      </div>
  </nav>

</div>

  <div class="container mt-3 mt-2">
	Album :
	<?php
	$album = mysqli_query($koneksi, "SELECT * FROM album WHERE userid='$userid'");
	while($row = mysqli_fetch_array($album)) { ?>
	<a href ="home.php?albumid=<?php echo $row['albumid'] ?>" class ="btn btn-outline-primary"> 
	<?php echo $row['namaalbum'] ?></a>
	  
	<?php } ?>
  
    <div class="row">
    <?php 
	if (isset($_GET['albumid'])) {
	$albumid  = $_GET['albumid'];
    $query = mysqli_query($koneksi, "SELECT * FROM foto WHERE userid='$userid' AND albumid='$albumid'");
    while($data = mysqli_fetch_array($query)) {
    ?>
        <div class="col-md-3">
          <a type="button" data-bs-toggle="modal" data-bs-target="#komentar<?php echo $data['fotoid']?>">
            <div class="card">
              <img style ="height: 12rem;" src="../assets/img/<?php echo $data['lokasifile'] ?>" class="card-img-top" 
			  title="<?php echo $data['judulfoto'] ?>">
              <div class="card-footer text-center">
				<?php
				$fotoid = $data['fotoid'];
				$ceksuka = mysqli_query($koneksi, "SELECT * FROM likefoto WHERE fotoid='$fotoid' AND userid='$userid'");
				$cekbatalsuka = mysqli_query($koneksi, "SELECT * FROM dislikefoto WHERE fotoid='$fotoid' AND userid='$userid'");
				if (mysqli_num_rows($ceksuka) == 1) { ?>
				<a href="../config/proses_like.php?fotoid=<?php echo $data ['fotoid'] ?>" type="submit" name="batalsuka"><i class="fa fa-thumbs-up m-1"></i></a>
				
				<?php } else { ?>
				<a href="../config/proses_like.php?fotoid=<?php echo $data ['fotoid'] ?>" type="submit" name="suka"><i class="fa-regular fa-thumbs-up m-1"></i></a>
				
				<?php }
				$like = mysqli_query($koneksi, "SELECT * FROM likefoto WHERE fotoid='$fotoid'");
				echo mysqli_num_rows($like). ' ';
				?>
				<?php
				if (mysqli_num_rows($cekbatalsuka) == 1) { ?>
				<a href="../config/proses_dislike.php?fotoid=<?php echo $data ['fotoid'] ?>" type="submit" name="batal_batalsuka"><i class="fa fa-thumbs-down m-1"></i></a>
				
				<?php } else { ?>
				<a href="../config/proses_dislike.php?fotoid=<?php echo $data ['fotoid'] ?>" type="submit" name="batalsuka"><i class="fa-regular fa-thumbs-down m-1"></i></a>
				
				<?php }
				$dislike = mysqli_query($koneksi, "SELECT * FROM dislikefoto WHERE fotoid='$fotoid'");
				echo mysqli_num_rows($dislike). ' ';
				?>
                <a href="#" type="button" data-bs-toggle="modal" data-bs-target="#komentar<?php echo $data['fotoid']?>"><i class="fa-regular fa-comment"></i> </a>
                <?php
                $jmlkomen = mysqli_query($koneksi, "SELECT * FROM komentarfoto WHERE fotoid='$fotoid'");
                echo mysqli_num_rows($jmlkomen).' ';
                ?>
              </div>
            </div>
          </a>

          <div class="modal fade" id="komentar<?php echo $data['fotoid'] ?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl">
              <div class="modal-content">
                <div class="modal-body">
                 <div class="row">
                  <div class="col-md-8">
                    <img src="../assets/img/<?php echo $data['lokasifile'] ?>" class="card-img-top" title="<?php echo $data['judulfoto'] ?>">
                  </div>
                  <div class="col-md-4">
                  <div class="m-2">
                    <div class="overflow-auto">
                      <div class="sticky-top">
                        <strong><?php echo $data['judulfoto'] ?></strong><br>
                        <span class="badge bg-secondary"><?php echo $data['tanggalunggah'] ?></span>
                      </div>
                      <hr>
                      <p align="left">
                        <?php echo $data['deskripsifoto'] ?>
                      </p>
                      <hr>
                      <?php
                      $fotoid = $data['fotoid'];
                      $komentar = mysqli_query($koneksi,"SELECT * FROM komentarfoto INNER JOIN user ON komentarfoto.userid=user.userid WHERE komentarfoto.fotoid='$fotoid'");
                      while($row = mysqli_fetch_array($komentar)){
                      ?>
                      <p align="left">
                        <strong><?php echo $row['namalengkap'] ?></strong>
                        <?php echo $row['isikomentar'] ?>
                      </p>
                    <?php } ?>
                    <hr>
                    <div class="sticky-bottom">
                      <form action="../config/proses_komentar.php" method="POST">
                        <div class="input-group">
                          <input type="hidden" name="fotoid" value="<?php echo $data['fotoid'] ?>">
                          <input type="text" name="isikomentar" class="form-control" placeholder="Tambah komentar">
                          <div class="input-group-prepend">
                           <button type="submit" name="kirimkomentar" class="btn btn-outline-primary"> Kirim </button>
                         </div>
                     </form>
					 </div>
                   </div>
                 </div>
               </div>
			</div>
			
             </div>
           </div>
         </div>
       </div>
     </div>

   </div>
<?php } } ?>
</div>
</div>

<footer class="d-flex justify-content-center border-top mt-3 bg-light fixed-bottom">
<p>&copy; TOMY ADITYA BATUBARA</p>
</footer>

<script type="text/javascript" src="../assets/js/bootstrap.min.js"></script>
</body>
</html>