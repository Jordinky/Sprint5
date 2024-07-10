use universidad

-- Base de dades Universidad

-- Si us plau, descàrrega la base de dades del fitxer schema_universidad.sql, visualitza el diagrama E-R en un editor i efectua les següents consultes:

-- Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els/les alumnes. El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.
select apellido1, apellido2, nombre from persona where tipo = 'alumno' order by apellido1 asc, apellido2, nombre

-- Esbrina el nom i els dos cognoms dels alumnes que no han donat d'alta el seu número de telèfon en la base de dades.
select nombre,apellido1, apellido2 from persona where tipo = 'alumno' and telefono is null or telefono = 0

-- Retorna el llistat dels alumnes que van néixer en 1999.
select * from persona where tipo = 'alumno' and fecha_nacimiento >= '1999-01-01 '

-- Retorna el llistat de professors/es que no han donat d'alta el seu número de telèfon en la base de dades i a més el seu NIF acaba en K.
select * from grado

-- Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7.
select * from asignatura where curso = 3 and id_grado = 7

-- Retorna un llistat dels professors/es juntament amb el nom del departament al qual estan vinculats. El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom.
select p.apellido1, p.apellido2, p.nombre, d.nombre from persona p, departamento d, profesor pf 
where p.id = pf.id_profesor 
order by p.apellido1 , p.nombre

-- Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne/a amb NIF 26902806M.
select a.nombre, c.anyo_inicio, c.anyo_fin 
from asignatura a, curso_escolar c, alumno_se_matricula_asignatura, persona p
where a.curso = c.id and id_alumno = p.id
and p.nif = '26902806M'

-- Retorna un llistat amb el nom de tots els departaments que tenen professors/es que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015).
select * from departamento where id in
 (select p.id_departamento from profesor p, asignatura a where a.id_profesor = p.id_profesor and p.id_profesor in 
	(select id from asignatura where id_grado in (select id from grado where nombre = 'Grado en Ingeniería Informática (Plan 2015)')))

-- Retorna un llistat amb tots els alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019.
select * from persona p, alumno_se_matricula_asignatura a 
where p.id = a.id_alumno 
and a.id_curso_escolar in (select id from curso_escolar where anyo_inicio = 2018)


-- Resol les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN.

-- Retorna un llistat amb els noms de tots els professors/es i els departaments que tenen vinculats. El llistat també ha de mostrar aquells professors/es que no tenen cap departament associat. El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor/a.  El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.departamento
select d.nombre as departamento, per.apellido1, per.apellido2, per.nombre
from profesor p
right join departamento d
on p.id_departamento = d.id
left join persona per
on per.id = p.id_profesor
order by d.nombre, per.apellido1, per.apellido2, per.nombre

-- Retorna un llistat amb els professors/es que no estan associats a un departament.
select per.nombre, per.apellido1, per.apellido2, d.nombre as departamento 
from persona per
left join profesor p
on per.id = p.id_profesor
left join departamento d
on d.id = p.id_departamento
where d.nombre is null

-- Retorna un llistat amb els departaments que no tenen professors/es associats.
select d.nombre as departamento, p.id_profesor from departamento d
left join profesor p
on d.id = p.id_departamento
where id_profesor is null

-- Retorna un llistat amb els professors/es que no imparteixen cap assignatura.
select p.id_profesor, a.nombre as asignantura
from profesor p
left join asignatura a
on a.id_profesor = p.id_profesor
where a.id is null

-- Retorna un llistat amb les assignatures que no tenen un professor/a assignat.
select a.nombre as asignantura, p.id_profesor
from asignatura a
left join profesor p
on a.id_profesor = p.id_profesor
where p.id_profesor is null


-- Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar.

-- Consultes resum:

-- Retorna el nombre total d'alumnes que hi ha.
select count(id) from persona where tipo = 'alumno'

-- Calcula quants alumnes van néixer en 1999.
select count(id) from persona where tipo = 'alumno'and fecha_nacimiento = '1999-01-01'

-- Calcula quants professors/es hi ha en cada departament. El resultat només ha de mostrar dues columnes, una amb el nom del departament i una altra amb el nombre de professors/es que hi ha en aquest departament. El resultat només ha d'incloure els departaments que tenen professors/es associats i haurà d'estar ordenat de major a menor pel nombre de professors/es.
select count(p.id_profesor) , d.nombre from profesor p, departamento d where d.id in (select id_departamento from profesor) group by d.nombre

-- Retorna un llistat amb tots els departaments i el nombre de professors/es que hi ha en cadascun d'ells. Tingui en compte que poden existir departaments que no tenen professors/es associats. Aquests departaments també han d'aparèixer en el llistat.
select d.nombre, per.nombre from departamento d, profesor p, persona per where per.id = p.id_profesor and d.id in (select id_departamento from profesor where id_departamento is not null or id_departamento is null) 

-- Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun. Tingues en compte que poden existir graus que no tenen assignatures associades. Aquests graus també han d'aparèixer en el llistat. El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures.
select g.nombre, count(a.id) from grado g LEFT JOIN asignatura a
on a.id_grado = g.id 
group by g.nombre
order by count(a.id) desc

-- Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun, dels graus que tinguin més de 40 assignatures associades.
select g.nombre, count(a.id) as total from grado g LEFT JOIN asignatura a
on a.id_grado = g.id
group by g.nombre
having count(a.id) > 40
order by count(a.id) desc

-- Retorna un llistat que mostri el nom dels graus i la suma del nombre total de crèdits que hi ha per a cada tipus d'assignatura. El resultat ha de tenir tres columnes: nom del grau, tipus d'assignatura i la suma dels crèdits de totes les assignatures que hi ha d'aquest tipus.
select g.nombre, a.tipo, sum(a.creditos) from grado g 
left join asignatura a
on a.id_grado = g.id 
group by g.nombre, a.tipo

-- Retorna un llistat que mostri quants alumnes s'han matriculat d'alguna assignatura en cadascun dels cursos escolars. El resultat haurà de mostrar dues columnes, una columna amb l'any d'inici del curs escolar i una altra amb el nombre d'alumnes matriculats.
select c.anyo_inicio, count(a.id_alumno)
from curso_escolar c
left join alumno_se_matricula_asignatura a
on c.id = a.id_curso_escolar
group by  c.anyo_inicio

-- Retorna un llistat amb el nombre d'assignatures que imparteix cada professor/a. El llistat ha de tenir en compte aquells professors/es que no imparteixen cap assignatura. El resultat mostrarà cinc columnes: id, nom, primer cognom, segon cognom i nombre d'assignatures. El resultat estarà ordenat de major a menor pel nombre d'assignatures.
select p.id_profesor, per.nombre, per.apellido1, per.apellido2, count(a.id)
from profesor p
left join persona per
on p.id_profesor = per.id
left join asignatura a
on a.id_profesor = p.id_profesor 
group by p.id_profesor
order by count(a.id) desc

-- Retorna totes les dades de l'alumne/a més jove.
select * from persona where fecha_nacimiento in (select min(fecha_nacimiento) from persona where tipo = 'alumno')

-- Retorna un llistat amb els professors/es que tenen un departament associat i que no imparteixen cap assignatura.
select per.nombre, per.apellido1, per.apellido2, d.nombre as departamento, a.nombre as asignatura from persona per
left join profesor p
on p.id_profesor = per.id
left join departamento d
on p.id_departamento = d.id
left join asignatura a
on a.id_profesor = p.id_profesor
where d.nombre is not null
and a.nombre is null



