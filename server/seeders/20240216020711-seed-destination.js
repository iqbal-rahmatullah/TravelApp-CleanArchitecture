'use strict';

/*@type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.bulkInsert('destinations', [{
      name: "Bromo Mountain",
      category: "East Java",
      cover: "bromo.jpeg",
      rate: 4.8,
      rate_count: 51,
      location: "Surabaya",
      description: "Gunung satu ini terletak di Taman Nasional Bromo Tengger Semeru, Jawa Timur. Banyak wisatawan lokal dan mancanegara yang berbondong-bondong ke sini demi menikmati keindahan pemandangan matahari terbit.Tak perlu khawatir capek berkeliling kawasan Gunung Bromo, banyak mobil jeep dan kuda yang bisa kamu sewa untuk berkeliling menikmati keindahannya Artikel ini telah tayang di Idntimes.com dengan judul ",
      images: "bromo1.webp,bromo2.webp,bromo3.webp",
      facilities: "Hiking",
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: "Semeru Mountain",
      category: "East Java",
      cover: "semeru.webp",
      rate: 4.9,
      rate_count: 100,
      location: "Malang",
      description: "Gunung Semeru adalah gunung yang paling tinggi di pulau Jawa dan bisa dikatakan sebagai salah satu wisata gunung paling populer di daki sepanjang tahun. Tentu saja alasan yang cukup masuk akal karena keindahan alam di gunung ini memang patut untuk dikunjungi",
      images: "semeru1.webp,semeru2.jpeg,semeru3.jepg",
      facilities: "Hiking",
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: "Rinjani Mountain",
      category: "NTB",
      cover: "rinjani.jpeg",
      rate: 4.9,
      rate_count: 51,
      location: "Lombok",
      description: "Pulau Lombok di Nusa Tenggara Barat tidak hanya memiliki keindahan pantai yang eksotis yang memukau. Di sana juga terdapat sebuah salah satu gunung paling populer di Indonesia yang sudah tersohor keindahannya. Gunung tersebut adalah Gunung Rinjani. ",
      images: "rinjani1.jpeg,rinjani2.jpeg,rinjani3.webp",
      facilities: "Hiking",
      createdAt: new Date(),
      updatedAt: new Date()
    },
    {
      name: "Puncak Jaya Wijaya Mountain",
      category: "Papua",
      cover: "jayawijaya.webp",
      rate: 4.8,
      rate_count: 51,
      location: "Surabaya",
      description: "Meskipun terletak di wilayah dengan iklim tropis, Puncak Jaya Wijaya merupakan puncak yang sangat populer untuk para pendaki, karena merupakan pegunungan yang diselimuti oleh salju. Puncak Jaya Wijaya memiliki ketinggian mencapai 4.884 mdpl",
      images: "jayawijaya1.webp,jayawijaya2.png,jayawijaya3.jpeg",
      facilities: "Hiking",
      createdAt: new Date(),
      updatedAt: new Date()
    },
    ], {});
  },

  async down(queryInterface, Sequelize) {
    await queryInterface.bulkDelete('destinations', null, {});
  }
};
