const SchemeModel = require("./scheme-model");
const yup = require("yup");

const stepSchema = yup.object().shape({
  instructions: yup.string("Hatalı step").required("Hatalı step"),
  step_number: yup.number("Hatalı step").min(1, "Hatalı step")
});

/*
  Eğer `scheme_id` veritabanında yoksa:

  durum 404
  {
    "message": "scheme_id <gerçek id> id li şema bulunamadı"
  }
*/
const checkSchemeId = async (req, res, next) => {
  try {
    let { scheme_id } = req.params;
    let scheme = await SchemeModel.findById(scheme_id);
    if (scheme === null) {
      res.status(404).json({
        message: `scheme_id ${scheme_id} id li şema bulunamadı`,
      });
    } else {
      next();
    }
  } catch (error) {
    next(error);
  }
};

/*
  Eğer `scheme_name` yoksa, boş string ya da string değil:

  durum 400
  {
    "message": "Geçersiz scheme_name"
  }
*/
const validateScheme = async (req, res, next) => {
  try {
    const {scheme_name} = req.body;
    if(typeof(scheme_name)!=="string" || !scheme_name){
      res.status(400).json({message:"Geçersiz scheme_name"});
    }else{
      next();
    }
  } catch (error) {}
};

/*
  Eğer `instructions` yoksa, boş string yada string değilse, ya da
  eğer `step_number` sayı değilse ya da birden küçükse:

  durum 400
  {
    "message": "Hatalı step"
  }
*/
const validateStep = async (req, res, next) => {
  try {
    await stepSchema.validate(req.body);
    next()
  } catch (error) {
    next(error);
  }
};
module.exports = {
  checkSchemeId,
  validateScheme,
  validateStep,
};
