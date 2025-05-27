//Källhänvisning: 'GridView in flutter with network image', //youtu.be/dx3gj5hz6HU?si=wjKTv8aTdT_EFeDV, av Youtube-kanalen 'Lets Code That', publicerad 7 januari 2019, hämtad 27 maj 2025.

  class StorePatches{
    String imageName;
    String itemImage;

    StorePatches.items({required this.imageName, required this.itemImage});

    }

    List<StorePatches> storePatchesList = [
      StorePatches.items(
      //entry nr 1
      itemImage: "https://www.agria.se/imagevault/publishedmedia/3yeuof282l7xb635mg4w/hund-som-ater-skonkost-iStock.jpg",
      imageName: "patch1"),
      //entry nr2 ...

      StorePatches.items(
        //entry nr 1
          itemImage: "https://www.agria.se/imagevault/publishedmedia/3yeuof282l7xb635mg4w/hund-som-ater-skonkost-iStock.jpg",
          imageName: "patch1"),

      StorePatches.items(
        //entry nr 1
          itemImage: "https://www.agria.se/imagevault/publishedmedia/b67oc7wqzuob2nddkpfe/ragdoll-and-norweigan-forest-cat.jpg",
          imageName: "patch1"),

      StorePatches.items(
        //entry nr 1
          itemImage: "https://www.agria.se/imagevault/publishedmedia/b67oc7wqzuob2nddkpfe/ragdoll-and-norweigan-forest-cat.jpg",
          imageName: "patch1"),
  ];