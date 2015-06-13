protocol CertificateGenerator
{
    func certificate() -> String
}

protocol CanBeModified
{
    mutating func canBeModified()
}

protocol LoadingDelegate
{
    func didLoading()
}

@objc protocol ListDataSource
{
    optional func numberOfRowInList(count: Int) -> Int
    optional var fixedRrows: Int{get}
}