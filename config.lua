Config = {}

Config.anamesleklimit = 400000                      -- Ana mesleğin limiti
Config.yanmesleklimit = 400000                      -- Yan mesleğin limiti

TC = { 
    ['Terzi'] = {
        inform = {
            MeslekIstek = false,                    -- İşkura bağlı mı olsun yoksa herkes yapabilsin mi ? 
            meslek = "terzi",                       -- Mesleğin ismi   
            MeslekTipi = "anameslek",               -- Limit sistemi bununla çalışıyor 2 tipi var anameslek yanmeslek ona göre çoğaltın
            limit = 5,                              -- Kaldırıldı
            kazanc = 1000,                          -- Eşyayı satınca tane başı fiyatı
            blipp = {},                             -- Dokunma.       
            ilkitem = "kumas",                      -- Toplanınca gelicek olan item
            item = "kiyafet",                       -- İşlenip satılacak olan item
            GerekenMiktar = 3,                      -- İşlenip satılabilmesi için kaç adet toplanması gerek 
            [1] = {
                Tipi = "toplama",       
                yer = { x = 712.79, y = -959.35, z = 30.4 },
                DrawText = "Kumas Almak Için ~g~ [E] ~s~ BAS",                                                                                  -- 3D TEXT'De gözükecek olan yazı
                Progressbar = {duration = 500, text = "Kumas Alınıyor", animDict = "missheistdockssetup1clipboard@idle_a", anim = "idle_a"},    -- DrawText ve animasyonlar
                eklenenItemMiktari = 1,                                                                                                         -- E bastığında İtem Verme mMiktarı
                blip = {coords = vector3(712.64, -959.36, 30.4), sprite = 366, color = 2, name = "Kumaş Alma"}
            },
            [2] = {
                Tipi = "isleme",
                yer = { x = 714.82, y = -972.12, z = 30.4 },
                DrawText = "Kuması Islemek Icın  ~r~[E] ~s~ Bas",
                Progressbar = {duration = 500, text = "Kumas isleniyor", animDict = "missheistdockssetup1clipboard@idle_a", anim = "idle_a"},
                eklenenItemMiktari = 1,
                blip = {coords = vector3(714.100, -959.36, 30.4), sprite = 366, color = 2, name = "Kumaş İşleme"}
            },
            [3] = {
                Tipi = "satis",
                yer = { x = 614.36, y = 2762.6, z = 42.09 },
                DrawText = "Kiyafetleri Satmak Icın ~r~[E]~s~ Bas",
                Progressbar = {duration = 500, text = "Kumas Satılıyor", animDict = "missheistdockssetup1clipboard@idle_a", anim = "idle_a"},
                eklenenItemMiktari = 1,
                blip = {coords = vector3(614.36, 2762.6, 42.09), sprite = 366, color = 2, name = "Kumaş Satma"}
            }
        }
    },
    ['Maden'] = {
        inform = {
            MeslekIstek = false,
            meslek = "maden",
            MeslekTipi = "yanmeslek", 
            limit = 50,
            kazanc = {3000, 2000, 1000},                     -- 1. Sıradaki elmas 2. Altın 3. Demir
            ilkitem = nil,
            item = {"elmas", "altin", "demir"},
            GerekenMiktar = 3,
            [1] = {
                Tipi = "toplama",
                yer = {x = -591.47, y = 2076.52, z = 131.37},
                DrawText = "Kazmak Icın ~y~E~s~ Bas",
                Progressbar = {duration = 500, text = "Maden Alınıyor", animDict = "missheistdockssetup1clipboard@idle_a", anim = "idle_a"},
                eklenenItemMiktari = 1,
                blip = {coords = vector3(-593.41, 2079.82, 131.42), sprite = 365, color = 28, name = "Maden Ocağı"}
            },
            [2] = {
                Tipi = "satis",
                yer = { x = -621.96, y = -230.74, z = 39.06 }, 
                DrawText = "Degerli esyalari satmak icin ~r~[E]~s~ Bas",
                Progressbar = {duration = 500, text = "Maden Satılıyor", animDict = "missheistdockssetup1clipboard@idle_a", anim = "idle_a"},
                eklenenItemMiktari = 1,
                blip = {coords = vector3(-623.45, -231.57, 38.06), sprite = 365, color = 28, name = "Değerli Eşya Alıcısı"}
            }
        }
    },
    ['Kasap'] = {
        inform = {
            MeslekIstek = false,
            meslek = "kasap",
            MeslekTipi = "anameslek", 
            limit = 50,
            kazanc = 1000,           
            blipp = {},         
            ilkitem = "tavuk",
            item = "paketlenmistavuk",  
            GerekenMiktar = 3,
            [1] = {
                Tipi = "toplama",
                yer = { x = -106.1, y = 6204.71, z = 31.03 },
                DrawText = "Kesilmis Et Almak Için ~r~E~s~ Bas",
                Progressbar = {duration = 500, text = "Etler alınıyor", animDict = "missheistdockssetup1clipboard@idle_a", anim = "idle_a"},
                eklenenItemMiktari = 1,
                blip = {coords = vector3(106.1, 6204.71, 31.03), sprite = 256, color = 5, name = "Kasap"}
            },
            [2] = {
                Tipi = "isleme",
                yer = { x = -95.72, y = 6207.04, z = 31.03 }, 
                DrawText = "Pisirmek Için Bas ~r~[E]~s~",
                Progressbar = {duration = 500, text = "Pişiriliyor", animDict = "missheistdockssetup1clipboard@idle_a", anim = "idle_a"},
                eklenenItemMiktari = 1,
                blip = {coords = vector3(106.1, 6204.71, 31.03), sprite = 256, color = 5, name = "Tavuk İşleme"}
            },
            [3] = {
                Tipi = "satis",
                yer = { x = 793.88, y = -735.49, z = 27.96 }, 
                DrawText = "Tavukları Satmak Icin ~r~[E]~s~ Bas",
                Progressbar = {duration = 500, text = "Satılıyor", animDict = "missheistdockssetup1clipboard@idle_a", anim = "idle_a"},
                eklenenItemMiktari = 1,
                blip = {coords = vector3(793.88, -735.49, 27.96), sprite = 256, color = 5, name = "Kasap Fabrikası Araç Çıkarma / Satış"}
            }
        }
    },
    ['Portakal'] = {
        inform = {
            MeslekIstek = false,
            meslek = "portakal",
            MeslekTipi = "yanmeslek",
            limit = 50,
            kazanc = 1000,
            ilkitem = "portakal",
            item = "portakalsuyu",
            blipp = {},
            GerekenMiktar = 3,
            [1] = {
                Tipi = "toplama",
                yer = {x = 2316.86,  y = 4993.01,  z = 42.03},
                DrawText = "Portakal Toplamak Icin ~r~E~s~ Bas",
                Progressbar = {duration = 500, text = "Portakal Alınıyor", animDict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", anim = "high_center_up"},
                eklenenItemMiktari = 1,
                blip = {coords = vector3(2312.24, 4981.01, 43.43), sprite = 467, color = 2, name = "Portakal Toplama"}
            },
            [2] = {
                Tipi = "isleme",
                yer = { x = -1660.21, y = -1043.88, z = 13.15 },
                DrawText = "Portakal Islemek Icin ~y~E~s~ Bas",
                Progressbar = {duration = 500, text = "Portakal isleniyor", animDict = "missheistdockssetup1clipboard@idle_a", anim = "idle_a"},
                eklenenItemMiktari = 1,
                blip = {coords = vector3(-1660.21, -1043.88, 13.15), sprite = 467, color = 2, name = "Portakal İşleme"}
            },
            [3] = {
                Tipi = "satis",
                yer = { x = 456.18, y = -2059.24, z = 24.92 },
                DrawText = "Portakalları Satmak Icin ~y~E~s~ Bas",
                Progressbar = {duration = 500, text = "Satılıyor", animDict = "missheistdockssetup1clipboard@idle_a", anim = "idle_a"},
                eklenenItemMiktari = 1,
                blip = {coords = vector3(456.18, -2059.24, 24.92), sprite = 467, color = 2, name = "Portakal Satma"}
            }
        }
    },
    ['Uzum'] = {
        inform = {
            MeslekIstek = false,
            meslek = "uzum",
            MeslekTipi = "yanmeslek",
            limit = 50,
            kazanc = 1000,
            blipp = {},
            ilkitem = "uzum",
            item = "sarap",
            GerekenMiktar = 3,
            [1] = {
                Tipi = "toplama",
                yer = {x = 1921.62, y = 4803.87, z = 44.23},
                DrawText = "Uzum Toplamak Icın ~r~E~s~ Bas",
                Progressbar = {duration = 500, text = "Uzum topluyorsun", animDict = "amb@prop_human_bum_bin@base", anim = "base"},
                eklenenItemMiktari = 1,
                blip = {coords = vector3(1921.89, 4804.24, 44.16), sprite = 468, color = 7, name = "Uzum Toplama"},
            },
            [2] = {
                Tipi = "isleme",
                yer = { x = 2553.5, y = 4668.1, z = 34.01 },
                DrawText = "Uzum Islemek Icin ~y~E~s~ Bas",
                Progressbar = {duration = 500, text = "Uzum İşleniyor", animDict = "missheistdockssetup1clipboard@idle_a", anim = "idle_a"},
                eklenenItemMiktari = 1,
                blip = {coords = vector3(2553.5, 4668.1, 34.01), sprite = 468, color = 7, name = "Üzüm İşleme"},
            },
            [3] = {
                Tipi = "satis",
                yer = { x = 2553.5, y = 4668.1, z = 34.01 },
                DrawText = "Şaraplari Satmak Icin ~y~E~s~ Bas",
                Progressbar = {duration = 500, text = "Şaraplar Satılıyor", animDict = "missheistdockssetup1clipboard@idle_a", anim = "idle_a"},
                eklenenItemMiktari = 1,
                blip = {coords = vector3(53.41, -1478.74, 29.29), sprite = 468, color = 7, name = "Şarap Satma"}
            }
        }
    }
}
