/*
 * FELADAT: Egy utazási iroda nyilvántartja az általa hirdetett úticélokat,
 * és az oda szervezett turnusokat, valamint az online felületükre regisztrált
 * felhasználókat és azok utazásait. Az adatbázis megtalálható az utazasdata.sql
 * fájlban. Írjuk meg az alábbi lekérdezéseket ezen adatokra!
 */
 
 /*
  * 9.0 Hogyan adnánk *utólag* hozzá a turnus táblához,
  * hogy az utazas_id külső kulcsként hivatkozik az utazas
  * tábla id attribútumára?
  */
  ALTER TABLE turnus
  ADD CONSTRAINT fk_turnus_utazas 
  FOREIGN KEY (utazas_id)
  REFERENCES utazas(id) 
 /*
  * 9.1 Országonként hány városba utazhatunk el?
  */
  SELECT orszag, COUNT(DISTINCT varos) AS varosok_szama
  FROM utazas
  GROUP BY orszag: 
 /*
  * 9.2 Jelenítsük meg az első tíz legtávolabbi úticélt.
  */

  SELECT varos, orszag, tavolsag
  FROM utazas
  ORDER BY tavolsag DESC 
  LIMIT 10
 /*
  * 9.3 Mely úticélok olcsóbbak 120.000 Ft-nál?
  */
  SELECT varos, orszag, ar
  FROM utazas
  WHERE ar < 120000;
 /*
  * 9.4 Adjuk meg, hogy egy felhasználó az eddigiekben
  * hány utat rendelt meg.
  */
  SELECT f.id AS felh_ID, f.felhasznalonev, COUNT(r.id) AS rendelt_utak_szama
  FROM felhasznalo f 
  LEFT JOIN rendeles r ON f.id = r.felh_ID
  GROUP BY f.id, f.felhasznalonev;
  
  /*
   * 9.5 Kik azok, akik több útra is elmentek?
   */
  SELECT f.id, f.felhasznalonev, COUNT(r.id) AS utak_szama
  FROM felhasznalo f
  JOIN rendeles r ON f.id = r.felh_ID
  GROUP BY f.id, f.felhasznalonev
  HAVING COUNT(r.id) > 1;
  /*
   * 9.6 Adjuk meg, hogy melyik 3 felhasználó költötte el
   * eddig a legtöbb pénzt, és mennyit.
   */

  SELECT f.id, f.felhasznalonev, SUM(u.alapar) AS osszes_kolt
  FROM felhasznalo f
  JOIN rendeles r ON f.id = r.felh_ID
  JOIN turnus t ON r.turnus_id = t.id
  JOIN utazas u ON t.utazas_id = u.id
  GROUP BY f.id, f.felhasznalonev
  ORDER BY osszes_kolt DESC
  LIMIT 3;
  
 /* 9.7 Mondjuk meg, melyik úticél(ok) a legnépszerűbb(ek). 
  * Adjuk meg azt is, melyik
  * indulási időpontban indulnak a legtöbben oda. 
  */
  SELECT u.varos, u.orszag, t.indulasi_ido, SUM(t.foglalt) AS osszes_foglalt
  FROM utazas u
  JOIN turnus t ON u.id = t.utazas_id
  GROUP BY u.varos, u.orszag, t.indulasi_ido
  ORDER BY osszes_foglalt DESC
  LIMIT 1;
  
 /*
  * 9.8 Adjunk meg nézettáblát, amin keresztül látjuk,
  * hogy az egyes utazásokra a különböző indulási
  * időpontokban összesen eddig mennyi pénzt költöttek.
  * (Nem biztos, hogy minden útból indítanak turnusokat.)
  */
  CREATE VIEW utazas_koltessel AS 
  SELECT u.id AS utazas_id, u.varos, u.orszag, t.indulasi ido, SUM(t.foglalt * u.alapar) AS osszes_kolt
  FROM utazas u 
  LEFT JOIN turnus t ON u.id = t.utazas_id
  GROUP BY u.id, u.varos, u.orszag, t.indulasi_ido;
 
 /*
  * 9.9 Listázzuk betűrendben nővekvő és ár szerint
  * csökkenő sorrendben az olyan utakat, amelyekből nem 
  * indulnak turnusok. 
  */
  
  /*
   * 9.10 Melyik utazásokból fog 2014. augusztusában 
   * valahány turnus indulni, és hány turnus fog belőlük
   * indulni ekkor?
   */










 