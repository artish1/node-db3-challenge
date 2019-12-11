const knex = require('knex');
const config = require('../knexfile');
const db = knex(config.development);

module.exports = {
    find,
    findById,
    findSteps,
    add,
    remove,
    update
}

function find(){
    return db("schemes");
}

function findById(id) {
    return db("schemes")
    .select("*")
    .where("id", "=", id)
    .first();
}

function findSteps(id){
    return db("steps as st")
    .select("st.id", "st.step_number", "st.instructions", "s.scheme_name")
    .join({ s: "schemes" }, "st.scheme_id", "=", "s.id")
    .where("st.scheme_id", "=", id)
    .orderBy("st.step_number");
}

function update(changes, id){
    return db("schemes")
    .where("id", "=", id)
    .update(changes)
    .then(() => {
        return findById(id);
    })
    
    

}

function add(scheme) {
    return db("schemes").insert(scheme, "id")
    .then(ids => {
        const [id] = ids;

        return findById(id);
    });
}

function remove(id){
    return db("schemes").del()
    .where("id", "=", id);
}