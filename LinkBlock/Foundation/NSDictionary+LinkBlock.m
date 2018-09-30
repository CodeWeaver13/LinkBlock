//
//  NSDictionary+LinkBlock.m
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlock.h"

@implementation NSObject(NSDictionaryLinkBlock)


- (NSObject* (^)(id))dictObjectForKey
{
    return ^id(id key){
        LinkHandle_REF(NSDictionary)
        LinkGroupHandle_REF(dictObjectForKey,key)
        return linkObjNotNil(_self[key]);
    };
}




- (BOOL (^)(id))dictContainsKey
{
    return ^(id key){
        return self.dictContainsKeyAs(key).boolValue;
    };
}

- (NSNumber* (^)(id))dictContainsKeyAs
{
    return ^id(id key){
        LinkHandle_REF(NSDictionary)
        LinkGroupHandle_REF(dictContainsKeyAs,key)
        return @([[_self allKeys] containsObject:key]);
    };
}

- (BOOL (^)(id))dictContainsValue
{
    return ^(id value){
        return self.dictContainsValueAs(value).boolValue;
    };
}

- (NSNumber* (^)(id))dictContainsValueAs
{
    return ^id(id value){
        LinkHandle_REF(NSDictionary)
        LinkGroupHandle_REF(dictContainsValueAs,value)
        return @([[_self allValues] containsObject:value]);
    };
}

- (NSArray *(^)(id))dictKeysForValue
{
    return ^id(id value){
        LinkHandle_REF(NSDictionary)
        LinkGroupHandle_REF(dictKeysForValue,value)
        id ret = [_self allKeysForObject:value];
        if([ret count] == 0) return [NSArray new];
        return ret;
    };
}



- (NSMutableDictionary *(^)(id, id))dictReplaceForKeyDepth
{
    return ^id(id replaceKey, id withKey){
        LinkHandle_REF(NSDictionary)
        LinkGroupHandle_REF(dictReplaceForKeyDepth,replaceKey,withKey)
        NSMutableDictionary* ret = [NSMutableDictionary dictionaryWithDictionary:_self];
        
        [[ret allKeys] enumerateObjectsUsingBlock:^(id  _Nonnull key, NSUInteger idx, BOOL * _Nonnull stop) {
            
            id value = ret[key];
            if([value isKindOfClass:[NSDictionary class]]){//层次遍历字典
                
                ret[key] = ((NSDictionary*)value).dictReplaceForKeyDepth(replaceKey , withKey);
            }
            if([value isKindOfClass:[NSArray class]]){//层次遍历数组
                
                ret[key] = ((NSArray*)value).arrReplaceKeyForDictionaryItemDepth(replaceKey, withKey);
            }
            
            if([[ret allKeys] containsObject:replaceKey]){//替换键
                
                ret[withKey] = ret[replaceKey];
                [ret removeObjectForKey:replaceKey];
            }
        }];
        
        return ret;
    };
}

- (NSMutableDictionary *(^)(id, id))dictReplaceForKey
{
    return ^id(id replaceKey, id withKey){
        LinkHandle_REF(NSDictionary)
        LinkGroupHandle_REF(dictReplaceForKey,replaceKey,withKey)
        NSMutableDictionary* result = [NSMutableDictionary dictionaryWithDictionary:_self];
        [[result allKeys] enumerateObjectsUsingBlock:^(id  _Nonnull key, NSUInteger idx, BOOL * _Nonnull stop) {
            
            if([[result allKeys] containsObject:replaceKey]){
                result[withKey] = result[replaceKey];
                [result removeObjectForKey:replaceKey];
            }
        }];
        return result;
    };
}

- (NSMutableDictionary *(^)(id,id))dictSetWithKeyObject
{
    if([self isKindOfClass:NSMutableDictionary.class])
        return self.m_dictSetWithKeyObject;
    
    return [[self mutableCopy] m_dictSetWithKeyObject];
}

- (NSMutableDictionary *(^)(NSDictionary *))dictAddEntries
{
    if([self isKindOfClass:NSMutableDictionary.class])
        return self.m_dictAddEntries;
    
    return [[self mutableCopy] m_dictAddEntries];
}

- (UIImage *(^)(void))dictForUIImagePickerControllerMediaType
{
    return ^id(){
        LinkHandle_REF(NSDictionary)
        LinkGroupHandle_REF(dictForUIImagePickerControllerMediaType)
        return _self[UIImagePickerControllerMediaType];
    };
}
- (UIImage *(^)(void))dictForUIImagePickerControllerOriginalImage
{
    return ^id(){
        LinkHandle_REF(NSDictionary)
        LinkGroupHandle_REF(dictForUIImagePickerControllerOriginalImage)
        return _self[UIImagePickerControllerOriginalImage];
    };
}
- (UIImage *(^)(void))dictForUIImagePickerControllerEditedImage
{
    return ^id(){
        LinkHandle_REF(NSDictionary)
        LinkGroupHandle_REF(dictForUIImagePickerControllerEditedImage)
        return _self[UIImagePickerControllerEditedImage];
    };
}
- (UIImage *(^)(void))dictForUIImagePickerControllerCropRect
{
    return ^id(){
        LinkHandle_REF(NSDictionary)
        LinkGroupHandle_REF(dictForUIImagePickerControllerCropRect)
        return _self[UIImagePickerControllerCropRect];
    };
}
- (UIImage *(^)(void))dictForUIImagePickerControllerMediaURL
{
    return ^id(){
        LinkHandle_REF(NSDictionary)
        LinkGroupHandle_REF(dictForUIImagePickerControllerMediaURL)
        return _self[UIImagePickerControllerMediaURL];
    };
}
- (UIImage *(^)(void))dictForUIImagePickerControllerReferenceURL
{
    return ^id(){
        LinkHandle_REF(NSDictionary)
        LinkGroupHandle_REF(dictForUIImagePickerControllerReferenceURL)
        return _self[UIImagePickerControllerReferenceURL];
    };
}
- (UIImage *(^)(void))dictForUIImagePickerControllerMediaMetadata
{
    return ^id(){
        LinkHandle_REF(NSDictionary)
        LinkGroupHandle_REF(dictForUIImagePickerControllerMediaMetadata)
        return _self[UIImagePickerControllerMediaMetadata];
    };
}
- (UIImage *(^)(void))dictForUIImagePickerControllerLivePhoto
{
    return ^id(){
        LinkHandle_REF(NSDictionary)
        LinkGroupHandle_REF(dictForUIImagePickerControllerLivePhoto)
        return _self[UIImagePickerControllerLivePhoto];
    };
}
@end
