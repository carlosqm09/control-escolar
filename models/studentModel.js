const db = require('../tools/mysql')

module.exports = {
    getAll: async (req,res)=>{
         const getStudeents =  await db.query('SELECT * FROM alumno')

         return getStudeents;
    },
    addNew: async (matricula, name, apellidop, apellidom, email)=>{
        const newStudent = await db.query(`INSERT INTO alumno (matricula, nombre, primer_apellido, segundo_apellido, email) 
        values(${db.escape(matricula)},${db.escape(name)}, ${db.escape(apellidop)}, ${db.escape(apellidom)}, ${db.escape(email)})`);
        return newStudent;

    }
    
}