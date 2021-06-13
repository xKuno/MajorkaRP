--------------------------------------------
------ Napisane przez wojtek.cfg#0349 ------
----------------- ©  2019 ------------------ koza gbur ham i prostak
--------------------------------------------


Config                         = {}

-- czas --
Config.Czasprzebierania		     = 5 -- 5 sekundy - czas przebierania ( robocze -> cywilne) // (cywilne -> robocze)
Config.czassmazenia            = 25 -- 15 sekund - czas smażenia mięsa
Config.czaskrojenia            = 10 -- 15 sekund - czas krojenia pomidora
Config.czasmycia               = 15 -- 15 sekund - czas mycia sałaty
Config.czasprzygotowania       = 35 -- 15 sekund - czas przygotowywania całego burgera
Config.czasprzygotowaniamax    = 25 -- 15 sekund - czas przygotowywania całego burgera
Config.czasprzygotowanidrinka  = 30 -- 15 sekund - czas przygotowywania całego burgera
Config.czassprzatania          = 70 -- 45 sekund - czas sprzątania toalety

-- szansa --
Config.szansa                  = 10 -- 1-100% na to że kilent zwymiotuje po zjedzeniu burgera
Config.bw                      = 1

-- Max. ilości przedmiotów, które może mieć gracz

-- Należy dokonać takich samych zmian w ograniczeniach bazy danych (tabela `items` kolumna `limit`)
Config.maxbulka                = 5 -- bułka
Config.maxpomidor              = 5 -- pomidor
Config.maxsalata               = 5 -- sałata
Config.maxmieso                = 5 -- mięso
Config.maxketchup              = 5 -- ketchup
Config.maxgmieso               = 5 -- usmażone mięso
Config.maxgpomidor             = 5 -- pokrojony pomidor
Config.maxgsalata              = 5 -- umyta sałata
Config.maxwhisky               = 5
Config.maxvodkaenergy          = 5 
Config.maxtequila              = 5 
Config.maxszklanka             = 5 

Config.maxburger               = 8 -- gotowe burgery
Config.maxburger               = 8 -- gotowe burgery



-- Wypłaty, pieniążki, itp. --
Config.losujwyplate       = true -- true wypłata będzie losowana z wartości Config.Wypłata1 - Config.Wypłata2 // false - gracz będzie otrzymywał stałą wypłatę zdefiniowaną w Config.Wyplatanielosuj

-- Jeśli gracz ma otrzymywać stały zarobek --
Config.Wyplatanielosuj    = 30

-- Jeśli chcesz losować zarobek --
Config.Wyplata1		  = 2249 -- najmniejsza zapłata
Config.Wyplata2 	  = 2450 -- największa zapłata
Config.Wyplata3       = 1100 -- najmniejsza zapłata
Config.Wyplata4       = 1250 -- największa zapłata
Config.Wyplata5       = 600 -- najmniejsza zapłata
Config.Wyplata6       = 750 -- największa zapłata






Config.Szefu = {

  Szef = {
    Pos   = { x = -1837.15, y = -1178.74, z = 19.22 }, -- koordynaty
    Size  = { x = 2.0, y = 2.0, z = 1.0 }, -- wielkość 
    Color = { r = 0, g = 100, b = 255 }, -- kolor (RGB) 
    Type  = 21, -- typ markera
  },
  
}

Config.StrefyJesliMaPrace = {

  Przebieralnia = {
    Pos   = { x = -1840.14, y = -1188.74, z = 14.32 }, -- koordynaty
    Size  = { x = 2.0, y = 2.0, z = 1.0 }, -- wielkość 
    Color = { r = 0, g = 100, b = 255 }, -- kolor (RGB) 
    Type  = 21, -- typ markera
  },
  
}

Config.Strefysprzatanko = {

  Sprzatanie = {
    Pos   = { x = -1836.76, y = -1178.03, z = 14.33 }, 
    Size  = { x = 2.0, y = 2.0, z = 1.0 }, 
    Color = { r = 0, g = 100, b = 255 }, 
    Type  = 21, 
  },
  
}

Config.StrefyJesliPrzebrany = { 
  
   Lodowka = {
    Pos   = { x = -1838.53, y = -1183.82, z = 14.33 },
    Size  = { x = 2.0, y = 2.0, z = 1.0 },
    Color = { r = 100, g = 255, b = 0 },  
    Type  = 21,
  },
  
   Smaz = {
    Pos   = { x = -1842.88, y = -1186.23, z = 14.33 },
    Size  = { x = 1.0, y = 1.0, z = 1.0 },
    Color = { r = 150, g = 100, b = 50 },  
    Type  = 21,
	},
	
   Kroj = {
    Pos   = { x = -1843.57, y = -1187.69, z = 14.33 },
    Size  = { x = 1.0, y = 1.0, z = 1.0 },
    Color = { r = 50, g = 150, b = 50 },  
    Type  = 21,
  },

  Myj = {
    Pos   = { x = -1841.71, y = -1184.13, z = 14.33 },
    Size  = { x = 1.0, y = 1.0, z = 1.0 },
    Color = { r = 50, g = 50, b = 150 },  
    Type  = 21,
  },
  
  Przyg = {
    Pos   = { x = -1837.84, y = -1186.13, z = 14.32 },
    Size  = { x = 1.0, y = 1.0, z = 1.0 },
    Color = { r = 150, g = 50, b = 50 },  
    Type  = 21,
  },

  Sprzedaz = {
    Pos   = { x = -1818.52, y = -1197.5, z = 14.47 },
    Size  = { x = 1.0, y = 1.0, z = 1.0 },
    Color = { r = 100, g = 255, b = 150 },  
    Type  = 29,
  },
  
}
--------------------------------------------
------ Napisane przez wojtek.cfg#0349 ------
----------------- ©  2019 ------------------
--------------------------------------------