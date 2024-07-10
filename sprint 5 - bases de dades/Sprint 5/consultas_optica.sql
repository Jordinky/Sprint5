	use tienda
    -- Llista el nom de tots els productes que hi ha en la taula producto.
    select nombre from producto
    -- Llista els noms i els preus de tots els productes de la taula producto.
    select nombre, precio from producto
    -- Llista totes les columnes de la taula producto.
    select * from producto
    -- Llista el nom dels productes, el preu en euros i el preu en dòlars estatunidencs (USD).
    select nombre, precio as precio_euros, truncate(precio * 1.1,2) as precio_dolares  from producto
    -- Llista el nom dels productes, el preu en euros i el preu en dòlars estatunidencs (USD). Utilitza els següents àlies per a les columnes: nom de producto, euros, dòlars.
    select nombre, precio as euros, truncate(precio * 1.1,2) as dolares from producto
    -- Llista els noms i els preus de tots els productes de la taula producto, convertint els noms a majúscula.
    select UPPER(nombre),precio from producto
    -- Llista els noms i els preus de tots els productes de la taula producto, convertint els noms a minúscula.
    select LOWER(nombre),preu from producto
   -- Llista el nom de tots els fabricants en una columna, i en una altra columna obtingui en majúscules els dos primers caràcters del nom del fabricant.
   select nombre, substr(nombre,1,2) as inicials from fabricante
    -- Llista els noms i els preus de tots els productes de la taula producto, arrodonint el valor del preu.
    select nombre, round(precio) from producto
	-- Llista els noms i els preus de tots els productes de la taula producto, truncant el valor del preu per a mostrar-lo sense cap xifra decimal.
    select nombre, truncate(precio,0) from producto
    -- Llista el codi dels fabricants que tenen productes en la taula producto.
    select f.codigo from fabricante f, producto p where f.codigo = p.codigo_fabricante    
    -- Llista el codi dels fabricants que tenen productes en la taula producto, eliminant els codis que apareixen repetits.
    select distinct(f.codigo) from fabricante f, producto p where f.codigo = p.codigo_fabricante
    -- Llista els noms dels fabricants ordenats de manera ascendent.
    select nombre from fabricante order by nombre asc
    -- Llista els noms dels fabricants ordenats de manera descendent.
    select nombre from fabricante order by nombre desc
   -- Llista els noms dels productes ordenats, en primer lloc, pel nom de manera ascendent i, en segon lloc, pel preu de manera descendent.
   select nombre, precio from producto order by nombre asc, precio desc
    -- Retorna una llista amb les 5 primeres files de la taula fabricante.
    SELECT * FROM fabricante limit 5
    -- Retorna una llista amb 2 files a partir de la quarta fila de la taula fabricante. La quarta fila també s'ha d'incloure en la resposta.
    
    -- Llista el nom i el preu del producte més barat. (Utilitza solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MIN(preu), necessitaria GROUP BY.
    select nombre, precio from producto where precio = (select min(precio) from producto)
    -- Llista el nom i el preu del producte més car. (Utilitza solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MAX(preu), necessitaria GROUP BY.
    select nombre, precio from producto where precio = (select max(precio) from producto)
    -- Llista el nom de tots els productes del fabricant el codi de fabricant del qual és igual a 2.
    select nom from producto where codigo = 2  
    -- Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades. Ordena el resultat pel nom del fabricant, per ordre alfabètic.
    select p.nombre,p.precio,f.nombre from producto p, fabricante f where p.codigo_fabricante = f.codigo
    -- Retorna una llista amb el codi del producte, nom del producte, codi del fabricador i nom del fabricador, de tots els productes de la base de dades.
    select p.codigo, p.nombre,p.codigo_fabricante, f.nombre from producto p, fabricante f where p.codigo_fabricante = f.codigo
    -- Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més barat.
    select p.nombre, p.precio,f.nombre  from producto p, fabricante f where p.codigo_fabricante = f.codigo and precio = (select min(precio) from producto)
    -- Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més car.
	select p.nombre, p.precio,f.nombre  from producto p, fabricante f where p.codigo_fabricante = f.codigo and precio = (select max(precio) from producto)
    -- Retorna una llista de tots els productes del fabricant Lenovo.
    select * from producto p, fabricante f where p.codigo_fabricante = f.codigo and f.nombre = "Lenovo"
    -- Retorna una llista de tots els productes del fabricant Crucial que tinguin un preu major que 200 €.
    select * from producto p, fabricante f where p.codigo_fabricante = f.codigo and f.nombre = "Crucial" and precio > 200
    -- Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packard y Seagate. Sense utilitzar l'operador IN.
    select * from producto where codigo_fabricante = 1 or codigo_fabricante = 3 or codigo_fabricante = 5
    -- Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packard y Seagate. Fent servir l'operador IN.
    select * from producto where codigo_fabricante in (select codigo from fabricante where nombre = "Asus" or nombre = "Hewlett-Packard" or nombre = "Seagate")
    -- Retorna un llistat amb el nom i el preu de tots els productes dels fabricants el nom dels quals acabi per la vocal e.
    
    -- Retorna un llistat amb el nom i el preu de tots els productes el nom de fabricant dels quals contingui el caràcter w en el seu nom.
    
    -- Retorna un llistat amb el nom de producte, preu i nom de fabricant, de tots els productes que tinguin un preu major o igual a 180 €. Ordena el resultat, en primer lloc, pel preu (en ordre descendent) i, en segon lloc, pel nom (en ordre ascendent).
	select  p.nombre, p.precio, f.nombre from fabricante f, producto p where p.codigo_fabricante = f.codigo and p.precio >= 180 order by p.precio desc, p.nombre asc
    -- Retorna un llistat amb el codi i el nom de fabricant, solament d'aquells fabricants que tenen productes associats en la base de dades.
    select p.codigo, p.nombre,f.nombre from producto p, fabricante f where f.codigo = p.codigo_fabricante
    -- Retorna un llistat de tots els fabricants que existeixen en la base de dades, juntament amb els productes que té cadascun d'ells. El llistat haurà de mostrar també aquells fabricants que no tenen productes associats.
    select * from fabricante where codigo in (select codigo_fabricante from producto) or codigo not in (select codigo_fabricante from producto)
    -- Retorna un llistat on només apareguin aquells fabricants que no tenen cap producte associat.
    select * from fabricante where codigo not in (select codigo_fabricante from producto)
    -- Retorna tots els productes del fabricador Lenovo. (Sense utilitzar INNER JOIN).
    select * from producto where codigo_fabricante in (select codigo from fabricante where nombre = "Lenovo")
    -- Retorna totes les dades dels productes que tenen el mateix preu que el producte més car del fabricant Lenovo. (Sense usar INNER JOIN).
    select * from producto where precio = (select max(p.precio) from producto p, fabricante f where p.codigo_fabricante = f.codigo and f.nombre = "Lenovo")
    -- Llista el nom del producte més car del fabricant Lenovo.
    select nombre from producto where precio = (select max(p.precio) from producto p, fabricante f where p.codigo_fabricante = f.codigo and f.nombre = "Lenovo")
    -- Llista el nom del producte més barat del fabricant Hewlett-Packard.
    select nombre from producto where precio = (select min(p.precio) from producto p, fabricante f where p.codigo_fabricante = f.codigo and f.nombre = "Hewlett-Packard")
    -- Retorna tots els productes de la base de dades que tenen un preu major o igual al producte més car del fabricant Lenovo.
    select * from producto where precio >= (select max(p.precio) from producto p, fabricante f where p.codigo_fabricante = f.codigo and f.nombre = "Lenovo")
    -- Llesta tots els productes del fabricant Asus que tenen un preu superior al preu mitjà de tots els seus productes.
    select * from producto p, fabricante f where p.codigo_fabricante = f.codigo and f.nombre = "Asus" and precio > (select avg(p.precio) from producto p where p.codigo_fabricante = f.codigo and f.nombre = "Asus")
