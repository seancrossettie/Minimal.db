import axios from "axios";
import config from "../config";

const getAllItems = () => new Promise((resolve, reject) => {
    axios.get(`${config.baseUrl}/api/items/getAllItems`)
    .then(response => resolve(response.data))
    .catch(error => reject(error));
})

export default getAllItems;