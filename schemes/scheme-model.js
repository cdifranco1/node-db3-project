const db = require('../data/db-config')

module.exports = {
  find,
  findById,
  findSteps, 
  add,
  update,
  remove
}

function find(){
  return db('schemes')
}

function findById(id){
  return (
    db('schemes')
      .where({ id })
      .first()
      .then(scheme => scheme ? scheme : null)
    ) 
}

function findSteps(id){
  return (
    db('schemes')
      .join('steps', 'schemes.id', 'steps.scheme_id')
      .select('steps.id', 'schemes.scheme_name', 'steps.step_number', 'steps.instructions')
      .where({scheme_id: id})
  ) 
}

function add(scheme){
  return (
    db('schemes')
      .insert(scheme)
      .then(([id]) => {
        return findById(id)
      })
  ) 
}

function update(changes, id){
  return (
    db('schemes')
      .where({ id })
      .update(changes)
      .then(() => {
        return findById(id)
      })
  ) 
}

function remove(id){
  let removedScheme;
  findById(id)
    .then(scheme => {
      if (scheme){
        removedScheme = scheme
      } else {
        removedScheme = null
      }
    })
  return (
    db('schemes')
      .where({ id })
      .del()
      .then(() => {
        return removedScheme
      })
    ) 
}


