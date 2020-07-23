//
//  Model.swift
//  Superplum
//
//  Created by Nitin on 25/04/20.
//  Copyright © 2020 Nitin. All rights reserved.
//

//
//{
//    "Result": {
//        "Batch": {
//            "Quantity": 0.00,
//            "QuantityRejected": null, let QuantityRejected : String?
//            "BuyPrice": 0.0, let BuyPrice : Double?
//            "IsFarmerReceivable": false, let IsFarmerReceivable : Bool?
//            "HarvestDate": "2020-02-22T05:30:00+05:30", let HarvestDate : String?
//            "ExpiryDate": "2020-03-08T05:30:00+05:30", let ExpiryDate : String
//            "Comments": null, let Comments : String?
//            "BatchCode": "53000012-02-2020", let BatchCode : String?
//            "SKU": "SSKKUU1", let SKU : String?
//            "SKUName": "Apple Royal Gar", let SKUName : String?
//            "ProductName": null, let ProductName : String?
//            "FarmName": "Nikhil Sharma", let FarmName : String?
//            "CompanyName": "Freshcore Internal Customer", let CompanyName : String?
//            "WarehouseName": "Greater Noida Warehouse", let WarehouseName : String?
//            "VariantName": null, let VariantName : String?
//            "HistoryQuantity": 10.00, let HistoryQuantity : Double?
//            "SupplierTypeID": 4, let SupplierTypeID : Int?
//            "Diameter": 14.2300, let Diameter : Double?
//            "AvgWeight": 22.2300, let AvgWeight : Double?
//            "TSS": 45.2200, let TSS : Double?
//            "ShapeIndex": 23.2300, let ShapeIndex : Double?
//            "PulpPercentage": 79.23, let PulpPercentage : Double?
//            "CrackingPercentage": 87.23, let CrackingPercentage Double?
//            "Acidity": 24.35, let Acidity : Double?
//            "DocumentNo": "53000012-02-2020", let DocumentNo : String?
//            "ColorID": 4, let ColorID : Int?
//            "ShapeID": 1, let ShapeID : Int?
//            "ColorName": "Red-5R", let CompanyName : String?
//            "ShapeName": "" let ShapeName:String?
//        },
//        "Company": {
//            "Name": "Freshcore Internal Customer", let Name : String?
//            "Address": "5th Floor, The Circle", let Address : String?
//            "PinCode": "122029", let PinCode : String?
//            "CityID": 4, let CityID : Int?
//            "StateID": 2, let StateID : Int?
//            "Lat": null, let Lat : String?
//            "Lng": null, let Lng : String?
//            "SupplierTypeID": 4, let SupplierTypeID : Int?
//            "CityName": "Gurgaon", let CityName : String?
//            "StateName": "Haryana", let StateName : String?
//            "SupplierTypeName": "Customer", let SupplierTypeName : String?
//            "AssetID": null let AssetID : String?
//        },
//        "SampleQC": {
//            "SampleQCID": 19, let SampleQCID : Int?
//            "EntityID": 14, let EntityID : Int?
//            "EntityTypeID": 8, let EntityTypeID : Int?
//            "ProductID": 1, let ProductID : Int?
//            "ProductVariantID": null, let ProductVariantID : Int?
//            "ProductScore": 3, let ProductScore : Int?
//            "SoilScore": 2, let SoilScore : Int?
//            "WaterScore": 2, let WaterScore : Int?
//            "OrganicTypeID": 2, let OrganicTypeID : Int?
//            "EntityName": "Nikhil Sharma", let EntityName : String?
//            "ProductName": "Apple", let ProductName : String?
//            "ProductVariantName": null, let ProductVariantName : String?
//            "OrganicTypeName": "Organically Grown", let OrganicTypeName : String?
//            "SampleQCType": 1, let SampleQCType : Int?
//            "OrganicType": 1, let OrganicType : Int?
//            "FruitCharacteristicsAssetIDs": null, let FruitCharacteristicsAssetIDs : String?
//            "SoilHealthCardAssetIDs": null, let SoilHealthCardAssetIDs : String?
//            "SoilTestingAssetIDs": [ let SoilTestingAssetIDs : [AssetsIDS]?
//            {
//            "FileAssetID": 89,
//            "ContentType": "image/jpeg"
//            }
//            ],
//            "WaterTestingAssetIDs": null, let WaterTestingAssetIDs : [AssetsIDS]?
//            "SamplingPlanDescriptionAssetIDs": null, let SamplingPlanDescriptionAssetIDs : [AssetsIDS]?
//            "ProductTestingAssetIDs": [ let ProductTestingAssetIDs : [AssetsIDS]?
//            {
//            "FileAssetID": 86,
//            "ContentType": "image/jpeg"
//            },
//            {
//            "FileAssetID": 87,
//            "ContentType": "image/jpeg"
//            },
//            {
//            "FileAssetID": 88,
//            "ContentType": "image/jpeg"
//            }
//            ]
//        },
//        "Product": {
//            "Name": "Apple", let Name : String?
//            "PrimaryAppColor": "bb4752", let PrimaryAppColor : String?
//            "SecondaryAppColor": "7ab588", let SecondaryAppColor : String?
//            "AppProductTagLine": "This is tag line\n\nNew Tag line", let AppProductTagLine : String?
//            "AssetID": { let AssetsID : AssetsIDS?
//                "FileAssetID": 91,
//                "ContentType": "image/jpeg"
//            }
//        },
//        "ProductVariant": {
//            "ProductName": "Apple", let ProductName : String?
//            "QualityIndexName": "A", let QualityIndexName : String?
//            "ProductVariationCategoryName": null, let ProductVariationCategoryName : String?
//            "ColorName": "Red", let ColorName : String?
//            "ShapeName": "Round", let ShapeName : String?
//            "ProductSKUID": 4, let ProductSKUID : Int?
//            "SKUName": "Apple Royal Gar", let SKUName : String?
//            "SKU": "SSKKUU1", let SKU : String?
//            "ProductVariantID": 7, let ProductVariantID : Int?
//            "Name": "Royal", let Name : String?
//            "ProductID": 1, let ProductID : Int?
//            "ProductVariationCategoryID": null, let ProductVariationCategoryID : String?
//            "QualityIndexID": 1, let QualityIndexID : Int?
//            "Diameter": 13.2000, let Diameter : Double?
//            "AvgWeight": 20.0000, let AvgWeight : Double?
//            "ColorID": 4, let ColorID : Int?
//            "ShapeID": 1, let ShapeID : Int?
//            "TSS": 45.0000, let TSS : Double?
//            "ShapeIndex": 23.0000, let ShapeIndex : Double?
//            "PulpPercentage": 78.00, let PulpPercentage : Double?
//            "Description": "", let Description : String?
//            "CrackingPercentage": 88.00, let CrackingPercentage : Double?
//            "BuyingPriceMin": 85.00, let BuyingPriceMin : Double?
//            "BuyingPriceMax": 100.00, let BuyingPriceMax : Double?
//            "BuyingPriceMedian": 95.00, let BuyingPriceMedian : Double?
//            "SellingPriceMin": null, let SellingPriceMin : Double?
//            "SellingPriceMax": null, let SellingPriceMax : Double?
//            "SellingPriceMedian": null, let SellingPriceMedian : Double?
//            "DefaultExpiry": 15, let DefaultExpiry : Int?
//            "Acidity": 25.00, let Acidity : Double?
//            "ConditionDescription": null, let ConditionDescription : String?
//            "TSSTolerance": 10.00, let TSSTolerance  :Double?
//            "AcidityMin": 10.00, let AcidityMin : Double?
//            "AcidityMax": 100.00, let AcidityMax : Double?
//            "DiameterMin": 8.5000, let DiameterMin : Double?
//            "DiameterMax": 19.8000, let DiameterMax : Double?
//            "WeightMin": 5.0000, let WeightMin : Double?
//            "WeightMax": 25.0000, let WeightMax : Double?
//            "TemperatureMin": null, let TemperatureMin : Double?
//            "TemperatureMax": null, let TemperatureMax : Double?
//            "HumidityMin": null, let HumidityMin : Double?
//            "HumidityMax": null, let HumidityMax : Double?
//            "OxyLevelMin": null, let OxyLevelMin : Double?
//            "OxyLevelMax": null, let OxyLevelMax : Double?
//            "COLevelMin": null, let COLevelMin : Double?
//            "COLevelMax": null, let COLevelMax : Double?
//            "EhleyenleLevelMin": null, let EhleyenleLevelMin : Double?
//            "EhleyenleLevelMax": null, let EhleyenleLevelMax : Double?
//            "ActionID": 0 let ActionID :Int?
//        },
//        "Farmlot": {
//            "CompanyName": "Freshcore Internal Customer", let CompanyName : String?
//            "VillageName": "Matiana", let VillageName : String?
//            "CityName": "Shimla", let CityName : String?
//            "StateName": "Himachal", let StateName : String?
//            "FarmLotAssetImage": null, let FarmLotImage : String?
//            "FarmLotID": 14, let FarmLotID : Int?
//            "CompanyID": 4, let CompanyID : Int?
//            "Name": "Nikhil Sharma", let Name : String?
//            "Lat": null, let Lat : String?
//            "Lng": null, let Lng : String?
//            "VillageID": 18, let VillageID : Int?
//            "CityID": 19, let CityID : Int?
//            "StateID": 29, let StateID : Int?
//            "FarmLotImage": null, let FarmLotImage : String?
//            "ActionID": 0 let ActionID : Int?
//        },
//        "Readings": {
//            "TemperatureReadings": [
//            {
//            "ID": 39,
//            "Dated": "2020-02-20T05:21:36.1665847+00:00",
//            "Value": 18.4200000000,
//            "TypeOfData": 1
//            },
//            {
//            "ID": 39,
//            "Dated": "2020-02-20T05:22:17.5739385+00:00",
//            "Value": 42.2300000000,
//            "TypeOfData": 1
//            },
//            {
//            "ID": 39,
//            "Dated": "2020-02-20T05:22:32.2149491+00:00",
//            "Value": 24.3200000000,
//            "TypeOfData": 1
//            },
//            {
//            "ID": 39,
//            "Dated": "2020-02-20T05:22:32.2149491+00:00",
//            "Value": 24.3200000000,
//            "TypeOfData": 1
//            }
//            ],
//            "HumidityReadings": [
//            {
//            "ID": 38,
//            "Dated": "2020-02-20T05:21:36.1665847+00:00",
//            "Value": 23.2500000000,
//            "TypeOfData": 1
//            },
//            {
//            "ID": 38,
//            "Dated": "2020-02-20T05:22:17.5739385+00:00",
//            "Value": 22.3200000000,
//            "TypeOfData": 1
//            },
//            {
//            "ID": 38,
//            "Dated": "2020-02-20T05:22:32.2149491+00:00",
//            "Value": 23.2300000000,
//            "TypeOfData": 1
//            }
//            ]
//        }
//    },
//    "HasError": false,
//    "Errors": null
//}

import Foundation

class SuperplumModel : Decodable {
    let Batch : Batch!
    let SampleQC : SampleQC!
    let Company : Company!
    let Product : Product!
    let ProductVariant : ProductVariant!
    let Farmlot : Farmlot!
    let Readings : Readings!
    
    init(Batch:Batch,SampleQC:SampleQC,Company:Company,Product:Product,ProductVariant:ProductVariant,Farmlot:Farmlot,Readings:Readings) {
        self.Batch = Batch
        self.SampleQC = SampleQC
        self.Company = Company
        self.Product = Product
        self.ProductVariant = ProductVariant
        self.Farmlot = Farmlot
        self.Readings = Readings
    }
}



class Batch : Decodable {
    let QuantityRejected : String?
    let BuyPrice : Double?
    let IsFarmerReceivable : Bool?
    let HarvestDate : String?
    let ExpiryDate : String
    let Comments : String?
    let BatchCode : String?
    let SKU : String?
    let SKUName : String?
    let ProductName : String?
    let FarmName : String?
    let CompanyName : String?
    let WarehouseName : String?
    let VariantName : String?
    let HistoryQuantity : Double?
    let SupplierTypeID : Int?
    let Diameter : Double?
    let AvgWeight : Double?
    let TSS : Double?
    let ShapeIndex : Double?
    let PulpPercentage : Double?
    let CrackingPercentage : Double?
    let Acidity : Double?
    let DocumentNo : String?
    let ColorID : Int?
    let ShapeID : Int?
    let ShapeName:String?
    
    init(QuantityRejected : String?,BuyPrice : Double?,IsFarmerReceivable : Bool?,HarvestDate : String?,ExpiryDate : String,Comments : String?,BatchCode : String?,SKU : String?,SKUName : String?,ProductName : String?,FarmName : String?,
         CompanyName : String?,WarehouseName : String?,VariantName : String?,HistoryQuantity : Double?,SupplierTypeID : Int?,Diameter : Double?,AvgWeight : Double?,TSS : Double?,
         ShapeIndex : Double?,PulpPercentage : Double?,CrackingPercentage: Double?,Acidity : Double?,DocumentNo : String?,ColorID : Int?,ShapeID : Int?,
         ShapeName:String?) {
        
        self.QuantityRejected = QuantityRejected
        self.BuyPrice = BuyPrice
        self.IsFarmerReceivable = IsFarmerReceivable
        self.HarvestDate = HarvestDate
        self.ExpiryDate = ExpiryDate
        self.Comments = Comments
        self.BatchCode = BatchCode
        self.SKU = SKU
        self.SKUName = SKUName
        self.ProductName = ProductName
        self.FarmName = FarmName
        self.CompanyName = CompanyName
        self.WarehouseName = WarehouseName
        self.VariantName = VariantName
        self.HistoryQuantity = HistoryQuantity
        self.SupplierTypeID = SupplierTypeID
        self.Diameter = Diameter
        self.AvgWeight = AvgWeight
        self.TSS = TSS
        self.ShapeIndex = ShapeIndex
        self.PulpPercentage  = PulpPercentage
        self.CrackingPercentage = CrackingPercentage
        self.Acidity = Acidity
        self.DocumentNo = DocumentNo
        self.ColorID = ColorID
        self.ShapeID = ShapeID
        self.ShapeName = ShapeName
    }
    
}
    class Company: Decodable {
        let Name : String?
        let Address : String?
        let PinCode : String?
        let CityID : Int?
        let StateID : Int?
        let Lat : Double?
        let Lng : Double?
        let SupplierTypeID : Int?
        let CityName : String?
        let StateName : String?
        let SupplierTypeName : String?
        let AssetID : AssetsID?
        
        init(Name : String?,Address : String?,PinCode : String?,CityID : Int?,               StateID : Int?,SupplierTypeID : Int?,CityName : String?,StateName : String?,SupplierTypeName : String?,AssetID : AssetsID?, Lat : Double?,Lng : Double?){
            self.Name = Name
            self.Address = Address
            self.PinCode = PinCode
            self.CityID = CityID
            self.StateID = StateID
            self.Lat = Lat
            self.Lng = Lng
            self.SupplierTypeID = SupplierTypeID
            self.CityName = CityName
            self.StateName = StateName
            self.SupplierTypeName = SupplierTypeName
            self.AssetID = AssetID
        }
    }
    
    class SampleQC : Decodable {
        
        let SampleQCID : Int?
        let EntityID : Int?
        let EntityTypeID : Int?
        let ProductID : Int?
        let ProductVariantID : Int?
        let ProductScore : Int?
        let SoilScore : Int?
        let WaterScore : Int?
        let OrganicTypeID : Int?
        let EntityName : String?
        let ProductName : String?
        let ProductVariantName : String?
        let OrganicTypeName : String?
        let SampleQCType : Int?
        let OrganicType : Int?
        let FruitCharacteristicsAssetIDs : String?
        let SoilHealthCardAssetIDs : String?
        let SoilTestingAssetIDs : [AssetsID]?
        let WaterTestingAssetIDs : [AssetsID]?
        let SamplingPlanDescriptionAssetIDs : [AssetsID]?
        let ProductTestingAssetIDs : [AssetsID]?
        
        
        init(SampleQCID : Int?,EntityID : Int?,EntityTypeID : Int?,ProductID : Int?
            ,ProductVariantID : Int?,ProductScore : Int?,SoilScore : Int?,WaterScore : Int?,OrganicTypeID : Int?,EntityName : String?,ProductName : String?,
             ProductVariantName : String?,OrganicTypeName : String?,SampleQCType : Int?,
             OrganicType : Int?,FruitCharacteristicsAssetIDs : String?,SoilHealthCardAssetIDs : String?,SoilTestingAssetIDs : [AssetsID]?,WaterTestingAssetIDs : [AssetsID]?,SamplingPlanDescriptionAssetIDs :[AssetsID]?,ProductTestingAssetIDs : [AssetsID]?) {
            
            self.SampleQCID = SampleQCID
            self.EntityID = EntityID
            self.EntityTypeID = EntityTypeID
            self.ProductID = ProductID
            self.ProductVariantID = ProductVariantID
            self.ProductScore = ProductScore
            self.SoilScore = SoilScore
            self.WaterScore = WaterScore
            self.OrganicTypeID  = OrganicTypeID
            self.EntityName = EntityName
            self.ProductName = ProductName
            self.ProductVariantName = ProductVariantName
            self.OrganicTypeName = OrganicTypeName
            self.SampleQCType = SampleQCType
            self.OrganicType = OrganicType
            self.FruitCharacteristicsAssetIDs = FruitCharacteristicsAssetIDs
            self.SoilHealthCardAssetIDs = SoilHealthCardAssetIDs
            self.SoilTestingAssetIDs = SoilTestingAssetIDs
            self.WaterTestingAssetIDs = WaterTestingAssetIDs
            self.SamplingPlanDescriptionAssetIDs = SamplingPlanDescriptionAssetIDs
            self.ProductTestingAssetIDs = ProductTestingAssetIDs
            
        }
        
        
    }
    
    class Product : Decodable {
        let Name : String?
        let PrimaryAppColor : String?
        let SecondaryAppColor : String?
        let AppProductTagLine : String?
        let AssetID : AssetsID?
        
        init(Name:String?,PrimaryAppColor:String?,SecondaryAppColor:String?,AppProductTagLine:String?,AssetID:AssetsID?) {
            self.Name = Name
            self.PrimaryAppColor = PrimaryAppColor
            self.SecondaryAppColor = SecondaryAppColor
            self.AppProductTagLine = AppProductTagLine
            self.AssetID = AssetID
        }
    }
    
    class ProductVariant : Decodable {
        let ProductName : String?
        let QualityIndexName : String?
        let ProductVariationCategoryName : String?
        let ColorName : String?
        let ShapeName : String?
        let ProductSKUID : Int?
        let SKUName : String?
        let SKU : String?
        let ProductVariantID : Int?
        let Name : String?
        let ProductID : Int?
        let ProductVariationCategoryID : Int?
        let QualityIndexID : Int?
        let Diameter : Double?
        let AvgWeight : Double?
        let ColorID : Int?
        let ShapeID : Int?
        let TSS : Double?
        let ShapeIndex : Double?
        let PulpPercentage : Double?
        let Description : String?
        let CrackingPercentage : Double?
        let BuyingPriceMin : String?
        let BuyingPriceMax : Int?
        let BuyingPriceMedian : String?
        let SellingPriceMin : String?
        let SellingPriceMax : String?
        let SellingPriceMedian : String?
        let DefaultExpiry : Int?
        let Acidity : Double?
        let ConditionDescription : String?
        let TSSTolerance : Double?
        let AcidityMin : Double?
        let AcidityMax : Double?
        let DiameterMin : Double?
        let DiameterMax : Double?
        let WeightMin : Double?
        let WeightMax : Double?
        let TemperatureMin : Double?
        let TemperatureMax : Double?
        let HumidityMin : Double?
        let HumidityMax : Double?
        let OxyLevelMin : Double?
        let OxyLevelMax : Double?
        let COLevelMin : Double?
        let COLevelMax : Double?
        let EhleyenleLevelMin : Double?
        let EhleyenleLevelMax : Double?
        let ActionID : Int?
        
        init(ProductName : String?,QualityIndexName : String?,ProductVariationCategoryName : String?,ColorName : String?,ShapeName : String?,ProductSKUID : Int?,SKUName : String?,SKU : String?,ProductVariantID : Int?,Name : String?,ProductID : Int?
            ,ProductVariationCategoryID : Int?,QualityIndexID : Int?,Diameter : Double?
            ,AvgWeight : Double?,ColorID : Int?,ShapeID : Int?,TSS : Double?,ShapeIndex : Double?,PulpPercentage : Double?,Description : String?,CrackingPercentage : Double?, BuyingPriceMin : String?,BuyingPriceMax : Int?,BuyingPriceMedian : String?, SellingPriceMin : String?, SellingPriceMax : String?,SellingPriceMedian : String?, DefaultExpiry : Int?,Acidity : Double?,ConditionDescription : String?, TSSTolerance : Double?,AcidityMin : Double?,AcidityMax : Double?,DiameterMin : Double?,DiameterMax : Double?,WeightMin : Double?,WeightMax : Double?, TemperatureMin : Double?,TemperatureMax : Double?,HumidityMin : Double?, HumidityMax : Double?,OxyLevelMin : Double?,OxyLevelMax : Double?,COLevelMin : Double?,COLevelMax : Double?,EhleyenleLevelMin : Double?,EhleyenleLevelMax : Double?,ActionID :Int?) {
            
            self.ProductName = ProductName
            self.QualityIndexName = QualityIndexName
            self.ProductVariationCategoryName = ProductVariationCategoryName
            self.ColorName = ColorName
            self.ShapeName = ShapeName
            self.ProductSKUID = ProductSKUID
            self.SKUName = SKUName
            self.SKU = SKU
            self.ProductVariantID = ProductVariantID
            self.Name = Name
            self.ProductID = ProductID
            self.ProductVariationCategoryID = ProductVariationCategoryID
            self.QualityIndexID = QualityIndexID
            self.Diameter = Diameter
            self.AvgWeight = AvgWeight
            self.ColorID = ColorID
            self.ShapeID = ShapeID
            self.TSS = TSS
            self.ShapeIndex = ShapeIndex
            self.PulpPercentage = PulpPercentage
            self.Description = Description
            self.CrackingPercentage = CrackingPercentage
            self.BuyingPriceMin = BuyingPriceMin
            self.BuyingPriceMax = BuyingPriceMax
            self.BuyingPriceMedian = BuyingPriceMedian
            self.SellingPriceMin = SellingPriceMin
            self.SellingPriceMax = SellingPriceMax
            self.SellingPriceMedian = SellingPriceMedian
            self.DefaultExpiry = DefaultExpiry
            self.Acidity = Acidity
            self.ConditionDescription = ConditionDescription
            self.TSSTolerance = TSSTolerance
            self.AcidityMin = AcidityMin
            self.AcidityMax = AcidityMax
            self.DiameterMin = DiameterMin
            self.DiameterMax = DiameterMax
            self.WeightMin = WeightMin
            self.WeightMax = WeightMax
            self.TemperatureMin = TemperatureMin
            self.TemperatureMax = TemperatureMax
            self.HumidityMin = HumidityMin
            self.HumidityMax = HumidityMax
            self.OxyLevelMin = OxyLevelMin
            self.OxyLevelMax = OxyLevelMax
            self.COLevelMin = COLevelMin
            self.COLevelMax = COLevelMax
            self.EhleyenleLevelMin = EhleyenleLevelMin
            self.EhleyenleLevelMax = EhleyenleLevelMax
            self.ActionID = ActionID
        }
    }
    
    class Farmlot : Decodable {
        let CompanyName : String?
        let VillageName : String?
        let CityName : String?
        let StateName : String?
        let FarmLotImage : String?
        let FarmLotID : Int?
        let CompanyID : Int?
        let Name : String?
        let Lat : String?
        let Lng : String?
        let VillageID : Int?
        let CityID : Int?
        let StateID : Int?
        let ActionID : Int?
        let FarmLotAssetImage : AssetsID?
        
        init(CompanyName : String?,VillageName : String?,CityName : String?,StateName : String?,FarmLotImage : String?,FarmLotID : Int?,CompanyID : Int?,Name : String?,Lat : String?,Lng : String?,VillageID : Int?,CityID : Int?,StateID : Int?,ActionID : Int?,FarmLotAssetImage : AssetsID?) {
            
            self.CompanyName = CompanyName
            self.VillageName = VillageName
            self.CityName = CityName
            self.StateName = StateName
            self.FarmLotImage = FarmLotImage
            self.FarmLotID = FarmLotID
            self.CompanyID = CompanyID
            self.Name = Name
            self.Lat = Lat
            self.Lng = Lng
            self.VillageID = VillageID
            self.CityID = CityID
            self.StateID = StateID
            self.ActionID = ActionID
            self.FarmLotAssetImage = FarmLotAssetImage
        }
    }
    
    class Readings : Decodable {
        let TemperatureReadings : [ReadingData]?
        let HumidityReadings : [ReadingData]?
        
        init(TemperatureReadings : [ReadingData]?, HumidityReadings : [ReadingData]?) {
            self.TemperatureReadings = TemperatureReadings
            self.HumidityReadings = HumidityReadings
        }
    }
    
    
    class ReadingData : Decodable {
        let ID : Int?
        let Dated : String?
        let Value : Double?
        let TypeOfData : Int?
        
        init(ID:Int?,Dated:String?,Value:Double?,TypeOfData:Int?) {
            self.ID = ID
            self.Dated = Dated
            self.Value = Value
            self.TypeOfData = TypeOfData
        }
    }
    
    class AssetsID : Decodable {
        
        let FileAssetID : Int?
        let ContentType : String?
        
        init(FileAssetID : Int?, ContentType:String?) {
            self.FileAssetID = FileAssetID
            self.ContentType = ContentType
        }
        
    }
    


