using Moq;
using Microsoft.EntityFrameworkCore;
using System.Linq.Expressions;
using Microsoft.EntityFrameworkCore.Query;
// Helper class for creating a DbSet mock
public static class DbContextMockHelper
{
    public static Mock<DbSet<T>> CreateDbSetMock<T>(List<T> data) where T : class
    {
        var queryable = data.AsQueryable();

        var dbSetMock = new Mock<DbSet<T>>();
        dbSetMock.As<IQueryable<T>>().Setup(m => m.Provider).Returns(new AsyncQueryProviderWrapper<T>(queryable.Provider));
        dbSetMock.As<IQueryable<T>>().Setup(m => m.Expression).Returns(queryable.Expression);
        dbSetMock.As<IQueryable<T>>().Setup(m => m.ElementType).Returns(queryable.ElementType);
        dbSetMock.As<IQueryable<T>>().Setup(m => m.GetEnumerator()).Returns(() => queryable.GetEnumerator());

        return dbSetMock;
    }

    // Helper class to wrap the query provider for async operations
    // Helper class to wrap the query provider for async operations
    private class AsyncQueryProviderWrapper<T> : IAsyncQueryProvider
    {
        private readonly IQueryProvider _inner;

        internal AsyncQueryProviderWrapper(IQueryProvider inner)
        {
            _inner = inner;
        }

        public IQueryable CreateQuery(Expression expression)
        {
            return new AsyncEnumerableQuery<T>(expression);
        }

        public IQueryable<TElement> CreateQuery<TElement>(Expression expression)
        {
            return new AsyncEnumerableQuery<TElement>(expression);
        }

        public object Execute(Expression expression)
        {
            return _inner.Execute(expression);
        }

        public TResult Execute<TResult>(Expression expression)
        {
            return _inner.Execute<TResult>(expression);
        }

        public IAsyncEnumerable<TResult> ExecuteAsync<TResult>(Expression expression)
        {
            return new AsyncEnumerableQuery<TResult>(expression);
        }

        public Task<TResult> ExecuteAsync<TResult>(Expression expression, CancellationToken cancellationToken)
        {
            var result = _inner.Execute<TResult>(expression);
            return Task.FromResult(result);
        }

        TResult IAsyncQueryProvider.ExecuteAsync<TResult>(Expression expression, CancellationToken cancellationToken)
        {
            var result = _inner.Execute<TResult>(expression);
            return result;
        }
    }


    // Helper class to provide an async enumerator for queryable
    private class AsyncEnumerableQuery<T> : EnumerableQuery<T>, IAsyncEnumerable<T>, IQueryable<T>
    {
        public AsyncEnumerableQuery(IEnumerable<T> enumerable)
            : base(enumerable)
        { }

        public AsyncEnumerableQuery(Expression expression)
            : base(expression)
        { }

        public IAsyncEnumerator<T> GetAsyncEnumerator(CancellationToken cancellationToken = default)
        {
            return new AsyncEnumeratorWrapper<T>(this.AsEnumerable().GetEnumerator());
        }
    }

    // Helper class to wrap the enumerator for async operations
    private class AsyncEnumeratorWrapper<T> : IAsyncEnumerator<T>
    {
        private readonly IEnumerator<T> _inner;

        public AsyncEnumeratorWrapper(IEnumerator<T> inner)
        {
            _inner = inner;
        }

        public T Current => _inner.Current;

        public ValueTask<bool> MoveNextAsync()
        {
            return new ValueTask<bool>(_inner.MoveNext());
        }

        public ValueTask DisposeAsync()
        {
            _inner.Dispose();
            return new ValueTask();
        }
    }

}
