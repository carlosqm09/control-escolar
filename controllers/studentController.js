const model = require('../models/studentModel')

module.exports = {
    index: (req,res)=>{
        res.render('index', { title: 'Express' });
    },
    studentsList: async(req,res)=>{
       const list = await model.getAll();
       console.log(list);
       res.render('studentView', {title:'Alumnos', list})

    },
    studentsAdd: async (req,res)=>{
        const {matricula, nombre, apellidop, apellidom, email} = req.body;
        
        await model.addNew(matricula, nombre, apellidop, apellidom, email);
        res.redirect('/');
    }
    
}