/*
   SwiftVideo, Copyright 2019 Unpause SAS

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
*/

import BrightFutures
import VectorMath

public protocol LiveAsset {
    func assetId() -> String
    func workspaceId() -> String
    func workspaceToken() -> String?
    func uuid() -> String
    func liveType() -> MediaSourceType
    func dialedOut() -> Bool
}

public protocol LivePublisher: LiveAsset {
    func acceptedFormats() -> [MediaFormat]
    func uri() -> String?
}

public protocol LiveSubscriber: LiveAsset {
    func suppliedFormats() -> [MediaFormat]
}

public typealias LiveOnConnection = (LivePublisher?, LiveSubscriber?) -> Future<Bool, RpcError>
public typealias LiveOnEnded = (String) -> Void