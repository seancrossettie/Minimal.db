﻿using System;
using System.Data.SqlClient;
using Dapper;
using Microsoft.Extensions.Configuration;
using Minimal.Models;

namespace Minimal.DataAccess
{
    public class ItemRepository
    {
        readonly string _connectionString;
        public ItemRepository(IConfiguration config)
        {
            _connectionString = config.GetConnectionString("Minimal");
        }

        internal object GetAllItems()
        {
            using var db = new SqlConnection(_connectionString);
            var items = db.Query<Item>(@"SELECT * FROM Item");
            return items;
        }

        internal object GetItemById(Guid itemId)
        {
            using var db = new SqlConnection(_connectionString);
            var item = db.Query<Item>(@"SELECT * FROM Item WHERE itemId = @itemId", new { itemId });
            if (item == null) return null;
            return item;
        }

        internal void CreateItem(Item newItem)
        {
            using var db = new SqlConnection(_connectionString);
            var sql = @"INSERT INTO Item(userId, itemName, itemDescription, timeOwned, quantity, isDuplicate, isRemoved, necessityRank)
                        OUTPUT inserted.itemId
                        VALUES(@userId, @itemName, @itemDescription, @timeOwned, @quantity, @isDuplicate, @isRemoved, @necessityRank)";

            var id = db.ExecuteScalar<Guid>(sql, newItem);
            newItem.ItemId = id;
        }

        internal object GetItemByName(string itemName)
        {
            string likeString = "%" + itemName + "%";
            using var db = new SqlConnection(_connectionString);
            var namedItem = db.Query<Item>(@"SELECT * FROM Item i WHERE i.itemName LIKE @likeString", new { likeString });
            return namedItem;
        }

        internal object RemoveItem(Guid itemId, Item item)
        {
            using var db = new SqlConnection(_connectionString);
            var sql = @"UPDATE Item
                        SET
                        userId = @userId,
                        itemName = @itemName,
                        itemDescription = @itemDescription,
                        timeOwned = @timeOwned,
                        quantity = @quantity,
                        isDuplicate = @isDuplicate,
                        isRemoved = 0,
                        necessityRank = @necessityRank
                        WHERE itemId = @itemId";
            item.ItemId = itemId;

            var removedItem = db.QueryFirstOrDefault<User>(sql, item);

            return removedItem;
        }

        internal object UpdateItem(Guid itemId, Item item)
        {
            using var db = new SqlConnection(_connectionString);
            var sql = @"UPDATE Item
                        SET
                        userId = @userId,
                        itemName = @itemName,
                        itemDescription = @itemDescription,
                        timeOwned = @timeOwned,
                        quantity = @quantity,
                        isDuplicate = @isDuplicate,
                        isRemoved = @isRemoved,
                        necessityRank = @necessityRank
                        WHERE itemId = @itemId";
            item.ItemId = itemId;

            var updatedItem = db.QueryFirstOrDefault<User>(sql, item);

            return updatedItem;
        }

        internal void DeleteItem(Guid itemId)
        {
            using var db = new SqlConnection(_connectionString);

            db.Execute(@"DELETE FROM Item WHERE itemId = @itemId", new { itemId });
        }
    }
}