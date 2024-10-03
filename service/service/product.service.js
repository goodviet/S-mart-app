
const M_Product = require('../model/M_Product')

export const createProduct = (body) => new Promise(async (resovle, reject)=>{
    try {
        const response = await M_Product.create()
    } catch (error) {
        
    }
})