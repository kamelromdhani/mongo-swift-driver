import libmongoc

public struct AggregateOptions: BsonEncodable {
    /// Enables writing to temporary files. When set to true, aggregation stages
    /// can write data to the _tmp subdirectory in the dbPath directory
    let allowDiskUse: Bool?

    /// The number of documents to return per batch.
    let batchSize: Int32?

    /// If true, allows the write to opt-out of document level validation. This only applies
    /// when the $out stage is specified.
    let bypassDocumentValidation: Bool?

    /// Specifies a collation.
    let collation: Document?

    /// The maximum amount of time to allow the query to run.
    let maxTimeMS: Int64?

    /// Enables users to specify an arbitrary string to help trace the operation through
    /// the database profiler, currentOp and logs. The default is to not send a value.
    let comment: String?

    /// The index to use for the aggregation. The hint does not apply to $lookup and $graphLookup stages.
    // let hint: Optional<(String | Document)>

    /// Convenience initializer allowing any/all parameters to be optional
    public init(allowDiskUse: Bool? = nil, batchSize: Int32? = nil, bypassDocumentValidation: Bool? = nil,
                collation: Document? = nil, maxTimeMS: Int64? = nil, comment: String? = nil) {
        self.allowDiskUse = allowDiskUse
        self.batchSize = batchSize
        self.bypassDocumentValidation = bypassDocumentValidation
        self.collation = collation
        self.maxTimeMS = maxTimeMS
        self.comment = comment
    }
}

public struct CountOptions: BsonEncodable {
    /// Specifies a collation.
    let collation: Document?

    /// The index to use.
    // let hint: Optional<(String | Document)>

    /// The maximum number of documents to count.
    let limit: Int64?

    /// The maximum amount of time to allow the query to run.
    let maxTimeMS: Int64?

    /// The number of documents to skip before counting.
    let skip: Int64?

    /// Convenience initializer allowing any/all parameters to be optional
    public init(collation: Document? = nil, limit: Int64? = nil, maxTimeMS: Int64? = nil, skip: Int64? = nil) {
        self.collation = collation
        self.limit = limit
        self.maxTimeMS = maxTimeMS
        self.skip = skip
    }
}

public struct DistinctOptions: BsonEncodable {
    /// Specifies a collation.
    let collation: Document?

    /// The maximum amount of time to allow the query to run.
    let maxTimeMS: Int64?

    /// Convenience initializer allowing any/all parameters to be optional
    public init(collation: Document? = nil, maxTimeMS: Int64? = nil) {
        self.collation = collation
        self.maxTimeMS = maxTimeMS
    }
}

public enum CursorType {
    /**
     * The default value. A vast majority of cursors will be of this type.
     */
    case nonTailable

    /**
     * Tailable means the cursor is not closed when the last data is retrieved.
     * Rather, the cursor marks the final object’s position. You can resume
     * using the cursor later, from where it was located, if more data were
     * received. Like any “latent cursor”, the cursor may become invalid at
     * some point (CursorNotFound) – for example if the final object it
     * references were deleted.
     *
     * - SeeAlso: https://docs.mongodb.com/meta-driver/latest/legacy/mongodb-wire-protocol/#op-query
     */
    case tailable

    /**
     * Combines the tailable option with awaitData, as defined below.
     *
     * Use with TailableCursor. If we are at the end of the data, block for a
     * while rather than returning no data. After a timeout period, we do return
     * as normal. The default is true.
     *
     * - SeeAlso: https://docs.mongodb.com/meta-driver/latest/legacy/mongodb-wire-protocol/#op-query
     */
    case tailableAwait

}

public struct FindOptions: BsonEncodable {
    /// Get partial results from a mongos if some shards are down (instead of throwing an error).
    let allowPartialResults: Bool?

    /// The number of documents to return per batch.
    let batchSize: Int32?

    /// Specifies a collation.
    let collation: Document?

    /// Attaches a comment to the query.
    let comment: String?

    /// Indicates the type of cursor to use. This value includes both the tailable and awaitData options.
    // commenting this out until we decide how to encode cursorType.
    // let cursorType: CursorType?

    /// The index to use.
    // let hint: Optional<(String | Document)>

    /// The maximum number of documents to return.
    let limit: Int64?

    /// The exclusive upper bound for a specific index.
    let max: Document?

    /// The maximum amount of time for the server to wait on new documents to satisfy a tailable cursor
    /// query. This only applies to a TAILABLE_AWAIT cursor. When the cursor is not a TAILABLE_AWAIT cursor,
    /// this option is ignored.
    let maxAwaitTimeMS: Int64?

    /// Maximum number of documents or index keys to scan when executing the query.
    let maxScan: Int64?

    /// The maximum amount of time to allow the query to run.
    let maxTimeMS: Int64?

    /// The inclusive lower bound for a specific index.
    let min: Document?

    /// The server normally times out idle cursors after an inactivity period (10 minutes)
    /// to prevent excess memory use. Set this option to prevent that.
    let noCursorTimeout: Bool?

    /// Limits the fields to return for all matching documents.
    let projection: Document?

    /// If true, returns only the index keys in the resulting documents.
    let returnKey: Bool?

    /// Determines whether to return the record identifier for each document. If true, adds a field $recordId
    /// to the returned documents.
    let showRecordId: Bool?

    /// The number of documents to skip before returning.
    let skip: Int64?

    /// The order in which to return matching documents.
    let sort: Document?

    /// Convenience initializer allowing any/all parameters to be optional
    public init(allowPartialResults: Bool? = nil, batchSize: Int32? = nil, collation: Document? = nil,
                comment: String? = nil, limit: Int64? = nil, max: Document? = nil, maxAwaitTimeMS: Int64? = nil,
                maxScan: Int64? = nil, maxTimeMS: Int64? = nil, min: Document? = nil, noCursorTimeout: Bool? = nil,
                projection: Document? = nil, returnKey: Bool? = nil, showRecordId: Bool? = nil, skip: Int64? = nil,
                sort: Document? = nil) {
        self.allowPartialResults = allowPartialResults
        self.batchSize = batchSize
        self.collation = collation
        self.comment = comment
        self.limit = limit
        self.max = max
        self.maxAwaitTimeMS = maxAwaitTimeMS
        self.maxScan = maxScan
        self.maxTimeMS = maxTimeMS
        self.min = min
        self.noCursorTimeout = noCursorTimeout
        self.projection = projection
        self.returnKey = returnKey
        self.showRecordId = showRecordId
        self.skip = skip
        self.sort = sort
    }
}

public struct InsertOneOptions: BsonEncodable {
    /// If true, allows the write to opt-out of document level validation.
    let bypassDocumentValidation: Bool?

    public init(bypassDocumentValidation: Bool? = nil) {
        self.bypassDocumentValidation = bypassDocumentValidation
    }
}

public struct InsertManyOptions: BsonEncodable {
    /// If true, allows the write to opt-out of document level validation.
    let bypassDocumentValidation: Bool?

    /// If true, when an insert fails, return without performing the remaining
    /// writes. If false, when a write fails, continue with the remaining writes, if any.
    /// Defaults to true.
    var ordered: Bool = true

    public init(bypassDocumentValidation: Bool? = nil, ordered: Bool? = true) {
        self.bypassDocumentValidation = bypassDocumentValidation
        if let o = ordered { self.ordered = o }
    }
}

public struct UpdateOptions: BsonEncodable {
    /// A set of filters specifying to which array elements an update should apply.
    let arrayFilters: [Document]?

    /// If true, allows the write to opt-out of document level validation.
    let bypassDocumentValidation: Bool?

    /// Specifies a collation.
    let collation: Document?

    /// When true, creates a new document if no document matches the query.
    let upsert: Bool?

    /// Convenience initializer allowing any/all parameters to be optional
    public init(arrayFilters: [Document]? = nil, bypassDocumentValidation: Bool? = nil, collation: Document? = nil,
                upsert: Bool? = nil) {
        self.arrayFilters = arrayFilters
        self.bypassDocumentValidation = bypassDocumentValidation
        self.collation = collation
        self.upsert = upsert
    }
}

public struct ReplaceOptions: BsonEncodable {
    /// If true, allows the write to opt-out of document level validation.
    let bypassDocumentValidation: Bool?

    /// Specifies a collation.
    let collation: Document?

    /// When true, creates a new document if no document matches the query.
    let upsert: Bool?

    /// Convenience initializer allowing any/all parameters to be optional
    public init(bypassDocumentValidation: Bool? = nil, collation: Document? = nil, upsert: Bool? = nil) {
        self.bypassDocumentValidation = bypassDocumentValidation
        self.collation = collation
        self.upsert = upsert
    }
}

public struct DeleteOptions: BsonEncodable {
    /// Specifies a collation.
    let collation: Document?

    public init(collation: Document? = nil) {
        self.collation = collation
    }
}

public struct InsertOneResult {
    /// The identifier that was inserted. If the server generated the identifier, this value
    /// will be null as the driver does not have access to that data.
    let insertedId: Any
}

public struct InsertManyResult {
    /// Map of the index of the inserted document to the id of the inserted document.
    let insertedIds: [Int64: String]

    /// Given a server response to an insertMany command, creates a corresponding
    /// `InsertManyResult`. If the `from` Document does not have an `insertedIds`
    /// field, the initialization will fail.
    internal init?(from: Document) {
        guard let inserted = from["insertedIds"] as? [String] else { return nil }
        var ids = [Int64: String]()
        for (i, id) in inserted.enumerated() {
            ids[Int64(i)] = id
        }
        self.insertedIds = ids
    }
}

public struct DeleteResult {
    /// The number of documents that were deleted.
    let deletedCount: Int

    /// Given a server response to a delete command, creates a corresponding
    /// `DeleteResult`. If the `from` Document does not have a `deletedCount`
    /// field, the initialization will fail.
    internal init?(from: Document) {
        guard let deletedCount = from["deletedCount"] as? Int else { return nil }
        self.deletedCount = deletedCount
    }
}

public struct UpdateResult {
    /// The number of documents that matched the filter.
    let matchedCount: Int

    /// The number of documents that were modified.
    let modifiedCount: Int

    /// The identifier of the inserted document if an upsert took place.
    let upsertedId: Any

    /// Given a server response to an update command, creates a corresponding
    /// `UpdateResult`. If the `from` Document does not have `matchedCount` and
    /// `modifiedCount` fields, the initialization will fail. The document may
    /// optionally have an `upsertedId` field. 
    internal init?(from: Document) {
         guard let matched = from["matchedCount"] as? Int, let modified = from["modifiedCount"] as? Int else {
            return nil
         }
         self.matchedCount = matched
         self.modifiedCount = modified
         self.upsertedId = from["upsertedId"] as Any
    }
}

public struct IndexModel: BsonEncodable {
    /// Contains the required keys for the index.
    let keys: Document

    /// Contains the options for the index.
    let options: IndexOptions?

    /// Convenience initializer providing a default `options` value
    public init(keys: Document, options: IndexOptions? = nil) {
        self.keys = keys
        self.options = options
    }

    /// Gets the default name for this index.
    internal var defaultName: String {
        return String(cString: mongoc_collection_keys_to_index_string(self.keys.data))
    }

    public func encode(to encoder: BsonEncoder) throws {
        // we need a flat document containing key, name, and options,
        // so encode the options directly to this encoder first
        try self.options?.encode(to: encoder)
        try encoder.encode(keys, forKey: "key")
        if self.options?.name == nil {
            try encoder.encode(self.defaultName, forKey: "name")
        }
    }

}

public struct IndexOptions: BsonEncodable {
    /// Optionally tells the server to build the index in the background and not block
    /// other tasks.
    let background: Bool?

    /// Optionally specifies the length in time, in seconds, for documents to remain in
    /// a collection.
    let expireAfter: Int32?

    /**
     * Optionally specify a specific name for the index outside of the default generated
     * name. If none is provided then the name is generated in the format "[field]_[direction]".
     *
     * Note that if an index is created for the same key pattern with different collations,
     * a name must be provided by the user to avoid ambiguity.
     *
     * - Example: For an index of name: 1, age: -1, the generated name would be "name_1_age_-1".
     */
    let name: String?

    /// Optionally tells the index to only reference documents with the specified field in
    /// the index.
    let sparse: Bool?

    /// Optionally used only in MongoDB 3.0.0 and higher. Specifies the storage engine
    /// to store the index in.
    let storageEngine: String?

    /// Optionally forces the index to be unique.
    let unique: Bool?

    /// Optionally specifies the index version number, either 0 or 1.
    let version: Int32?

    /// Optionally specifies the default language for text indexes. Is english if none is provided.
    let defaultLanguage: String?

    /// Optionally Specifies the field in the document to override the language.
    let languageOverride: String?

    /// Optionally provides the text index version number.
    let textVersion: Int32?

    /// Optionally specifies fields in the index and their corresponding weight values.
    let weights: Document?

    /// Optionally specifies the 2dsphere index version number.
    let sphereVersion: Int32?

    /// Optionally specifies the precision of the stored geo hash in the 2d index, from 1 to 32.
    let bits: Int32?

    /// Optionally sets the maximum boundary for latitude and longitude in the 2d index.
    let max: Double?

    /// Optionally sets the minimum boundary for latitude and longitude in the index in a 2d index.
    let min: Double?

    /// Optionally specifies the number of units within which to group the location values in a geo haystack index.
    let bucketSize: Int32?

    /// Optionally specifies a filter for use in a partial index. Only documents that match the
    /// filter expression are included in the index.
    let partialFilterExpression: Document?

    /// Optionally specifies a collation to use for the index in MongoDB 3.4 and higher.
    /// If not specified, no collation is sent and the default collation of the collection
    /// server-side is used.
    let collation: Document?

    public init(background: Bool? = nil, expireAfter: Int32? = nil, name: String? = nil, sparse: Bool? = nil,
                storageEngine: String? = nil, unique: Bool? = nil, version: Int32? = nil,
                defaultLanguage: String? = nil, languageOverride: String? = nil, textVersion: Int32? = nil,
                weights: Document? = nil, sphereVersion: Int32? = nil, bits: Int32? = nil, max: Double? = nil,
                min: Double? = nil, bucketSize: Int32? = nil, partialFilterExpression: Document? = nil,
                collation: Document? = nil) {
        self.background = background
        self.expireAfter = expireAfter
        self.name = name
        self.sparse = sparse
        self.storageEngine = storageEngine
        self.unique = unique
        self.version = version
        self.defaultLanguage = defaultLanguage
        self.languageOverride = languageOverride
        self.textVersion = textVersion
        self.weights = weights
        self.sphereVersion = sphereVersion
        self.bits = bits
        self.max = max
        self.min = min
        self.bucketSize = bucketSize
        self.partialFilterExpression = partialFilterExpression
        self.collation = collation
    }
}

// A MongoDB Collection
public class Collection {
    private var _collection = OpaquePointer(bitPattern: 1)
    private var _client: Client?
    /**
        Initializes a new Collection instance, not meant to be instantiated directly
     */
    internal init(fromCollection: OpaquePointer, withClient: Client) {
        self._collection = fromCollection
        self._client = withClient
    }

    /**
        Deinitializes a Collection, cleaning up the internal mongoc_collection_t
     */
    deinit {
        guard let collection = self._collection else {
            return
        }

        mongoc_collection_destroy(collection)
        self._collection = nil
        self._client = nil
    }

    /**
     * Drops this collection from its parent database
     */
    func drop() throws {
        var error = bson_error_t()
        if !mongoc_collection_drop(self._collection, &error) {
            throw MongoError.commandError(message: toErrorString(error))
        }
    }

    /**
     * Finds the documents in this collection which match the provided filter
     *
     * - Parameters:
     *   - filter: A `Document` that should match the query
     *   - options: Optional settings
     *
     * - Returns: A `Cursor` with the results
     */
    func find(_ filter: Document, options: FindOptions? = nil) throws -> Cursor {
        let encoder = BsonEncoder()
        let opts = try encoder.encode(options)
        guard let cursor = mongoc_collection_find_with_opts(self._collection, filter.data, opts?.data, nil) else {
            throw MongoError.invalidResponse()
        }
        guard let client = self._client else {
            throw MongoError.invalidClient()
        }
        return Cursor(fromCursor: cursor, withClient: client)
    }

    /**
     * Runs an aggregation framework pipeline against this collection
     *
     * - Parameters:
     *   - pipeline: The pipeline of aggregation operations to perform
     *   - options: Optional settings
     *
     * - Returns: A `Cursor` with the results
     */
    func aggregate(_ pipeline: [Document], options: AggregateOptions? = nil) throws -> Cursor {
        let encoder = BsonEncoder()
        let opts = try encoder.encode(options)
        let pipeline: Document = ["pipeline": pipeline]
        guard let cursor = mongoc_collection_aggregate(
            self._collection, MONGOC_QUERY_NONE, pipeline.data, opts?.data, nil) else {
            throw MongoError.invalidResponse()
        }
        guard let client = self._client else {
            throw MongoError.invalidClient()
        }
        return Cursor(fromCursor: cursor, withClient: client)
    }

    /**
     * Counts the number of documents matching the provided filter
     *
     * - Parameters:
     *   - filter: The filter that documents must match in order to be counted
     *   - options: Optional settings
     *
     * - Returns: The count of the documents that matched the filter
     */
    func count(_ filter: Document = [:], options: CountOptions? = nil) throws -> Int {
        let encoder = BsonEncoder()
        let opts = try encoder.encode(options)
        var error = bson_error_t()
        // because we already encode skip and limit in the options, 
        // pass in 0s so we don't get duplicate parameter errors. 
        let count = mongoc_collection_count_with_opts(
            self._collection, MONGOC_QUERY_NONE, filter.data, 0, 0, opts?.data, nil, &error)

        if count == -1 { throw MongoError.commandError(message: toErrorString(error)) }

        return Int(count)
    }

    /**
     * Finds the distinct values for a specified field across the collection
     *
     * - Parameters:
     *   - fieldName: The field for which the distinct values will be found
     *   - filter: The filter that documents must match in order to be considered for this operation
     *   - options: Optional settings
     *
     * - Returns: A 'Cursor' containing the distinct values for the specified criteria
     */
    func distinct(fieldName: String, filter: Document, options: DistinctOptions? = nil) throws -> Cursor {
        guard let client = self._client else {
            throw MongoError.invalidClient()
        }

        let collName = String(cString: mongoc_collection_get_name(self._collection))
        let command: Document = [
            "distinct": collName,
            "key": fieldName,
            "query": filter
        ]
        let encoder = BsonEncoder()
        let opts = try encoder.encode(options)

        let reply = Document()
        var error = bson_error_t()
        if !mongoc_collection_read_command_with_opts(
            self._collection, command.data, nil, opts?.data, reply.data, &error) {
            throw MongoError.commandError(message: toErrorString(error))
        }

        let fakeReply: Document = [
            "ok": 1,
            "cursor": [
                "id": 0,
                "ns": "",
                "firstBatch": [reply]
            ] as Document
        ]

        // mongoc_cursor_new_from_command_reply will bson_destroy the data we pass in,
        // so copy it to avoid destroying twice (already done in Document deinit)
        let fakeData = bson_copy(fakeReply.data)
        guard let newCursor = mongoc_cursor_new_from_command_reply(client._client, fakeData, 0) else {
            throw MongoError.invalidResponse()
        }

        return Cursor(fromCursor: newCursor, withClient: client)
    }

    /**
     * Inserts the provided document. If the document is missing an identifier, one will be
     * generated for it
     *
     * - Parameters:
     *   - document: The document to insert
     *   - options: Optional settings
     *
     * - Returns: The optional result of attempting to perform the insert. If the write concern
     *            is unacknowledged, nil is returned
     */
    func insertOne(_ document: Document, options: InsertOneOptions? = nil) throws -> InsertOneResult? {
        let encoder = BsonEncoder()
        let opts = try encoder.encode(options)
        var error = bson_error_t()
        if !mongoc_collection_insert_one(self._collection, document.data, opts?.data, nil, &error) {
            throw MongoError.commandError(message: toErrorString(error))
        }
        // Only return a result if we know the _id of the inserted document.
        guard let _id = document["_id"] else { return nil }
        return InsertOneResult(insertedId: _id)
    }

    /**
     * Inserts the provided documents. If any documents are missing an identifier,
     * the driver will generate them
     *
     * - Parameters:
     *   - documents: The documents to insert
     *   - options: Optional settings
     *
     * - Returns: The optional result of attempting to performing the insert. If the write concern
     *            is unacknowledged, nil is returned
     */
    func insertMany(_ documents: [Document], options: InsertManyOptions? = nil) throws -> InsertManyResult? {
        let encoder = BsonEncoder()
        let opts = try encoder.encode(options)
        var docPointers = documents.map { UnsafePointer($0.data) }
        let reply = Document()
        var error = bson_error_t()
        if !mongoc_collection_insert_many(
            self._collection, &docPointers, documents.count, opts?.data, reply.data, &error) {
            throw MongoError.commandError(message: toErrorString(error))
        }
        return InsertManyResult(from: reply)
    }

    /**
     * Replaces a single document matching the provided filter in this collection
     *
     * - Parameters:
     *   - filter: Document representing the match criteria
     *   - replacement: The replacement document
     *   - options: Optional settings
     *
     * - Returns: The optional result of attempting to replace a document. If the write concern
     *            is unacknowledged, nil is returned
     */
    func replaceOne(filter: Document, replacement: Document, options: ReplaceOptions? = nil) throws -> UpdateResult? {
        let encoder = BsonEncoder()
        let opts = try encoder.encode(options)
        let reply = Document()
        var error = bson_error_t()
        if !mongoc_collection_replace_one(
            self._collection, filter.data, replacement.data, opts?.data, reply.data, &error) {
            throw MongoError.commandError(message: toErrorString(error))
        }
        return UpdateResult(from: reply)
    }

    /**
     * Updates a single document matching the provided filter in this collection
     *
     * - Parameters:
     *   - filter: Document representing the match criteria
     *   - update: Document representing the update to be applied to a matching document
     *   - options: Optional settings
     *
     * - Returns: The optional result of attempting to update a document. If the write concern is
     *            unacknowledged, nil is returned
     */
    func updateOne(filter: Document, update: Document, options: UpdateOptions? = nil) throws -> UpdateResult? {
        let encoder = BsonEncoder()
        let opts = try encoder.encode(options)
        let reply = Document()
        var error = bson_error_t()
        if !mongoc_collection_update_one(
            self._collection, filter.data, update.data, opts?.data, reply.data, &error) {
            throw MongoError.commandError(message: toErrorString(error))
        }
        return UpdateResult(from: reply)
    }

    /**
     * Updates multiple documents matching the provided filter in this collection
     *
     * - Parameters:
     *   - filter: Document representing the match criteria
     *   - update: Document representing the update to be applied to matching documents
     *   - options: Optional settings
     *
     * - Returns: The optional result of attempting to update multiple documents. If the write
     *            concern is unacknowledged, nil is returned
     */
    func updateMany(filter: Document, update: Document, options: UpdateOptions? = nil) throws -> UpdateResult? {
        let encoder = BsonEncoder()
        let opts = try encoder.encode(options)
        let reply = Document()
        var error = bson_error_t()
        if !mongoc_collection_update_many(
            self._collection, filter.data, update.data, opts?.data, reply.data, &error) {
            throw MongoError.commandError(message: toErrorString(error))
        }
        return UpdateResult(from: reply)
    }

    /**
     * Deletes a single matching document from the collection
     *
     * - Parameters:
     *   - filter: Document representing the match criteria
     *   - options: Optional settings
     *
     * - Returns: The optional result of performing the deletion. If the write concern is
     *            unacknowledged, nil is returned
     */
    func deleteOne(_ filter: Document, options: DeleteOptions? = nil) throws -> DeleteResult? {
        let encoder = BsonEncoder()
        let opts = try encoder.encode(options)
        let reply = Document()
        var error = bson_error_t()
        if !mongoc_collection_delete_one(
            self._collection, filter.data, opts?.data, reply.data, &error) {
            throw MongoError.commandError(message: toErrorString(error))
        }
        return DeleteResult(from: reply)
    }

    /**
     * Deletes multiple documents
     *
     * - Parameters:
     *   - filter: Document representing the match criteria
     *   - options: Optional settings
     *
     * - Returns: The optional result of performing the deletion. If the write concern is
     *            unacknowledged, nil is returned
     */
    func deleteMany(_ filter: Document, options: DeleteOptions? = nil) throws -> DeleteResult? {
        let encoder = BsonEncoder()
        let opts = try encoder.encode(options)
        let reply = Document()
        var error = bson_error_t()
        if !mongoc_collection_delete_many(
            self._collection, filter.data, opts?.data, reply.data, &error) {
            throw MongoError.commandError(message: toErrorString(error))
        }
        return DeleteResult(from: reply)
    }

    /**
     * Creates an index over the collection for the provided keys with the provided options
     *
     * - Parameters:
     *   - model: An `IndexModel` representing the keys and options for the index
     *
     * - Returns: The name of the created index
     */
    func createIndex(_ forModel: IndexModel) throws -> String {
        return try createIndexes([forModel])[0]
    }

    /**
     * Creates an index over the collection for the provided keys with the provided options
     *
     * - Parameters:
     *   - keys: The keys for the index
     *   - options: Optional settings
     *
     * - Returns: The name of the created index
     */
    func createIndex(_ keys: Document, options: IndexOptions? = nil) throws -> String {
        return try createIndex(IndexModel(keys: keys, options: options))
    }

    /**
     * Creates multiple indexes in the collection
     *
     * - Parameters:
     *   - models: An array of `IndexModel` specifying the indexes to create
     *
     * - Returns: The names of all the indexes that were created
     */
    func createIndexes(_ forModels: [IndexModel]) throws -> [String] {
        let collName = String(cString: mongoc_collection_get_name(self._collection))
        let command: Document = [
            "createIndexes": collName,
            "indexes": try forModels.map { try BsonEncoder().encode($0) }
        ]
        var error = bson_error_t()
        if !mongoc_collection_write_command_with_opts(self._collection, command.data, nil, nil, &error) {
            throw MongoError.commandError(message: toErrorString(error))
        }

        return forModels.map { $0.options?.name ?? $0.defaultName }
    }

     /**
     * Drops a single index from the collection by the index name
     *
     * - Parameters:
     *   - name: The name of the index to drop
     *
     */
    func dropIndex(_ name: String) throws {
        var error = bson_error_t()
        if !mongoc_collection_drop_index(self._collection, name, &error) {
            throw MongoError.commandError(message: toErrorString(error))
        }
    }

    /**
     * Attempts to drop a single index from the collection given the keys and options
     *
     * - Parameters:
     *   - keys: The keys for the index
     *   - options: Optional settings
     *
     * - Returns: The result of the command returned from the server
     */
    func dropIndex(_ keys: Document, options: IndexOptions? = nil) throws -> Document {
        return try dropIndex(IndexModel(keys: keys, options: options))
    }

    /**
     * Attempts to drop a single index from the collection given an `IndexModel`
     *
     * - Parameters:
     *   - model: The model describing the index to drop
     *
     * - Returns: The result of the command returned from the server
     */
    func dropIndex(_ model: IndexModel) throws -> Document {
        return try _dropIndexes(keys: model.keys)
    }

    /**
     * Drops all indexes in the collection
     *
     * - Returns: The result of the command returned from the server
     */
    func dropIndexes() throws -> Document {
        return try _dropIndexes()
    }

    private func _dropIndexes(keys: Document? = nil) throws -> Document {
        let collName = String(cString: mongoc_collection_get_name(self._collection))
        let command: Document = ["dropIndexes": collName, "index": keys ?? "*"]
        let reply = Document()
        var error = bson_error_t()
        if !mongoc_collection_write_command_with_opts(self._collection, command.data, nil, reply.data, &error) {
            throw MongoError.commandError(message: toErrorString(error))
        }

        return reply
    }

    /**
     * Returns a list of the indexes currently on this collection
     *
     * - Returns: A `Cursor` over a collection of index names
     */
    func listIndexes() throws -> Cursor {
        guard let cursor = mongoc_collection_find_indexes_with_opts(self._collection, nil) else {
            throw MongoError.invalidResponse()
        }
        guard let client = self._client else {
            throw MongoError.invalidClient()
        }
        return Cursor(fromCursor: cursor, withClient: client)
    }
}